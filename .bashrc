alias ls='ls --color=auto'
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
function gitlisten(){
  while
    inotifywait -q -r -e create,move,modify,delete --exclude "\.git" .;
  do
    git add . &&
    git commit -m auto >/dev/null &&
    git push -q ;
  done &
}
