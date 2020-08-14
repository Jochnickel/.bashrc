alias ls='ls --color=auto'

function gitlisten(){
  while
    inotifywait -q -r -e create,move,modify,delete --exclude "\.git" .;
  do
    git add . &&
    git commit -m auto >/dev/null &&
    git push -q ;
  done &
}
