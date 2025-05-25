configure_fzf() {
  # https://manpages.ubuntu.com/manpages/lunar/en/man1/fzf.1.html#key/event%20bindings
  local FZF_KEYBINDINGS="\
    --bind='alt-p:toggle-preview' \
    --bind='ctrl-u:preview-page-up' \
    --bind='ctrl-d:preview-page-down' \
    --bind='ctrl-v:execute(nvim {+})+abort' \
    --bind='ctrl-x:clear-query' \
    --bind='ctrl-a:beginning-of-line' \
    --bind='ctrl-e:end-of-line' \
    --bind='ctrl-y:yank' \
  "

  # local COLOR_OPTS="
  #   --color=fg:#ffffff,bg:#000000,hl:#00ff00 \
  #   --color=bg+:#000000,hl+:#00ff00 \
  #   --color=info:#00ff00,prompt:#00ff00,pointer:#00ff00 \
  #   --color=marker:#00ff00,spinner:#00ff00 \
  #   --color=header:#ffffff,fg+:#ffffff,bg+:#000000 \
  # "

  export FZF_DEFAULT_COMMAND=$(_get_fzf_default_command)
  export FZF_DEFAULT_OPTS="--ansi --multi"

  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_OPTS="$FZF_KEYBINDINGS $(_get_fzf_pager)"

  export FZF_CTRL_R_OPTS="--no-preview --height 40% --layout=reverse --no-border"

  export FZF_ALT_C_COMMAND=$(_get_fzf_alt_c_command)
  export FZF_ALT_C_OPTS="--preview '$(_get_fzf_alt_c_preview_script)' --height 100%  --no-border"

  export FZF_COMPLETION_TRIGGER='**'
  export FZF_COMPLETION_OPTS="--border --info=inline"
  export FZF_COMPLETION_PATH_OPTS="--walker file,dir,follow,hidden"
  export FZF_COMPLETION_DIR_OPTS="--walker dir,follow"
}

_get_fzf_pager() {
  local FZF_PAGER=""

  if command -v bat &> /dev/null
  then
    FZF_PAGER="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
  else
    FZF_PAGER="--preview '\cat {}'"
  fi

  echo "$FZF_PAGER"
}

# set default command for fzf
_get_fzf_default_command() {
  local FZF_DEFAULT_COMMAND=''

  # Check if fd is installed
  if command -v fd &> /dev/null; then
    # Exclude .git, node_modules, submodules, and env
    FZF_DEFAULT_COMMAND='fd \
      --type file \
      --color=always \
      --follow \
      --hidden \
      --no-ignore-vcs \
      --exclude .git \
      --exclude node_modules \
      --exclude backup-dotfiles \
      --exclude submodules \
      --exclude env \
      --exclude .venv \
    '
  elif command -v rg &> /dev/null; then
    FZF_DEFAULT_COMMAND='rg \
      --files \
      --hidden \
      --follow \
      --no-ignore-vcs \
      --color=always \
      --glob "!.git/*" \
      --glob "!node_modules/*" \
      --glob "!backup-dotfiles/*" \
      --glob "!submodules/*" \
      --glob "!env/*" \
      --glob "!*.venv/*" \
    '
  else
    FZF_DEFAULT_COMMAND='find . \
      -type f \
      -prune \
      -not -path "*/\.git/*" \
      -not -path "*/node_modules/*" \
      -not -path "*/backup-dotfiles/*" \
      -not -path "*/submodules/*" \
      -not -path "*/env/*" \
      -not -path "*/.venv/*" \
      --follow \
    '
  fi

  echo "$FZF_DEFAULT_COMMAND"
}

_get_fzf_alt_c_command() {
  local FZF_ALT_C_COMMAND=''

  if command -v fd &> /dev/null; then
    FZF_ALT_C_COMMAND='fd \
      --type d \
      --color=always \
      --follow \
      --hidden \
      --no-ignore-vcs \
      --exclude .git \
      --exclude node_modules \
      --exclude backup-dotfiles \
      --exclude submodules \
      --exclude env \
      --exclude .venv \
    '
  else
    FZF_ALT_C_COMMAND='find . \
      -type d \
      -prune \
      -not -path "*/\.git/*" \
      -not -path "*/node_modules/*" \
      -not -path "*/backup-dotfiles/*" \
      -not -path "*/submodules/*" \
      -not -path "*/env/*" \
      -not -path "*/.venv/*" \
      --follow \
    '
  fi

  echo "$FZF_ALT_C_COMMAND"
}

_get_fzf_alt_c_preview_script() {
  local FZF_ALT_C_PREVIEW=''

  if command -v tree &> /dev/null
  then
    FZF_ALT_C_PREVIEW="tree -C {} | head -200"
  else
    FZF_ALT_C_PREVIEW="ls -la {} | head -200"
  fi

  echo "$FZF_ALT_C_PREVIEW"
}

configure_fzf
