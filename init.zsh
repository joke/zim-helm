(( ${+commands[helm]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[helm]:-"$(${commands[asdf]} which helm 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_helm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'helm'. Regenerated completions.
  fi
} ${0:h}
