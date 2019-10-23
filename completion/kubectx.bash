_kube_contexts()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  if [ -z $2 ]; then
      COMPREPLY=( $(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ) );
  else
      COMPREPLY=$(kubectl config get-contexts --output='name' | fzf --ansi -q $2 -1);
  fi
  
}

complete -F _kube_contexts kubectx kctx ctx
