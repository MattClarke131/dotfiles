#!/usr/bin/env bun

import { readFileSync, readdirSync, existsSync } from "fs";
import { join, relative, resolve, dirname } from "path";
import { Command } from "commander";
import { minimatch } from "minimatch";

function loadGitignorePatterns(dir: string): string[] {
  const gitignorePath = join(dir, ".gitignore");
  if (!existsSync(gitignorePath)) return [];
  return readFileSync(gitignorePath, "utf8")
    .split("\n")
    .map((l) => l.trim())
    .filter((l) => l && !l.startsWith("#"));
}

function loadParentPatterns(dir: string): string[] {
  const patterns: string[] = [];
  let current = dirname(dir);
  while (current !== dirname(current)) {
    patterns.push(...loadGitignorePatterns(current));
    current = dirname(current);
  }
  return patterns;
}

function isIgnored(rel: string, patterns: string[]): boolean {
  return patterns.some((p) =>
    // exact match or path is inside an ignored directory
    rel === p ||
    rel.startsWith(`${p}/`) ||
    // glob pattern matching (e.g. *.log, dist/**)
    minimatch(rel, p, { matchBase: true, dot: true }) ||
    minimatch(rel, `${p}/**`, { dot: true })
  );
}

const program = new Command();

program
  .name("catdir")
  .description("Concatenate all files in a directory to stdout")
  .argument("[dir]", "Directory to scan", ".")
  .option("-t, --no-titles", "Disable file headers")
  .option("-i, --no-ignore", "Ignore .gitignore rules")
  .option("-e, --exclude <glob>", "Exclude files matching glob pattern")
  .action((dir: string, options: { titles: boolean; ignore: boolean; exclude?: string }) => {
    const absDir = resolve(dir);
    const basePatterns = options.ignore
      ? []
      : [...loadParentPatterns(absDir), ...loadGitignorePatterns(absDir)];
    const files: string[] = [];

    const walk = (d: string, patterns: string[]) => {
      // pick up .gitignore in each subdir as we descend
      const localPatterns = options.ignore ? patterns : [...patterns, ...loadGitignorePatterns(d)];

      for (const entry of readdirSync(d, { withFileTypes: true })) {
        const full = join(d, entry.name);
        const rel = relative(absDir, full);

        if (isIgnored(rel, localPatterns)) continue;
        if (options.exclude && minimatch(rel, options.exclude, { matchBase: true })) continue;
        if (entry.isSymbolicLink()) continue;
        if (entry.isDirectory()) {
          walk(full, localPatterns);
          continue;
        }
        files.push(full);
      }
    };

    walk(absDir, basePatterns);
    files.sort();

    const output = files
      .map((f) => {
        const content = readFileSync(f, "utf8");
        return options.titles ? `=== ${relative(absDir, f)} ===\n${content}` : content;
      })
      .join("\n\n");

    process.stdout.write(output);
  });

program.parse();
