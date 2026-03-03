# tools

Personal CLI tools for dotfiles. Each tool is a Bun TypeScript workspace.

## Structure
```
tools/
├── package.json       # workspace root
├── bun.lock
└── <toolname>/
    ├── index.ts
    ├── package.json
    ├── tsconfig.json
    └── README.md
```

## Install dependencies
```bash
bun install
```

## Build a tool
```bash
bun build --compile <toolname>/index.ts --outfile ~/.local/bin/<toolname>
```

## Build all tools
```bash
for dir in */; do
  [ -f "$dir/index.ts" ] && bun build --compile "$dir/index.ts" --outfile ~/.local/bin/"${dir%/}"
done
```

## Adding a new tool
```bash
mkdir <toolname> && cd <toolname>
bun init -y
bun add <dependencies>
# write index.ts, then build
```
