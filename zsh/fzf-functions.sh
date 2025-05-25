# Search through aliases and print the selected alias to the prompt.
search_and_print_alias() {
  local selected=$(
    alias | fzf --height 100% --info=inline | cut -d '=' -f 1
  )

  if [[ -n $selected ]]; then
    print -z "$selected"
  fi
}
