# catdir

Concatenate all files in a directory to stdout, respecting `.gitignore` rules.

## Usage
```bash
catdir [dir] [options]
```

Arguments:
- `dir` — directory to scan (default: `.`)

Options:
- `-t, --no-titles` — disable file headers
- `-i, --no-ignore` — ignore `.gitignore` rules
- `-e, --exclude <glob>` — exclude files matching glob pattern

## Examples
```bash
catdir                        # current dir
catdir src                    # specific dir
catdir src -e "*.test.ts"     # exclude test files
catdir . | pbcopy             # copy to clipboard
catdir . -i                   # include node_modules etc.
```

## Development
```bash
bun install
bun run index.ts
```
