local command="${commands[helm]:-${commands[asdf]:+$(asdf which helm)}}"

if (( ! ${+command} )); then
  return 1
fi

local compfile=${0:h}/functions/_helm
if [[ ! -e $compfile || $compfile -ot $command ]]; then
  $command completion zsh >| $compfile
fi
