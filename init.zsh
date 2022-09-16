(( ${+commands[helm]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[helm]:-"$(${commands[asdf]} which helm 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_helm
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile

} ${0:h}
