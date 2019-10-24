 _kube_namespaces()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  if [ -z $2 ]; then
      COMPREPLY=( $(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}')" -- $curr_arg ) );
  else
      COMPREPLY=( $(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}' | fzf --ansi -q $2 -1 )" -- $curr_arg ) );
  fi

}
complete -F _kube_namespaces kubens kns ns
