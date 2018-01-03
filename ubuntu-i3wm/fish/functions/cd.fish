function _fzf_change_directory
  if [ (count $argv) ]
    fzf --select-1 --exit-0 --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    fzf --select-1 --exit-0 |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    _builtin_cd $foo
  else
    commandline ''
  end
end
function fzf_change_directory
  begin
    echo $HOME/Documents
    echo $HOME/Desktop
    echo $HOME/.config
    find ./ -type d -maxdepth 1 | read x
    if [ $x ]
     echo $x  |perl -pe "s#^#$PWD/#"|egrep -v "^$PWD/\."|head -n 5
     sort -r -t '|' -k 3 ~/.z|sed -e 's/\|.*//'
    end
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _fzf_change_directory $argv
end

function _parent_dirs
  set d (dirname (pwd))
  echo $d
  while test $d != "/"
    set d (dirname $d)
    echo $d
  end
end

function _builtin_cd
  builtin cd $argv
  if [ $status -eq 0 ]
    ls -a
  end
end

function cd
  if [ -z $argv ]
    fzf_change_directory
  else if [ $argv = ".." ]
    _parent_dirs | fzf | read d
    if [ $d ]
      echo $d
      _builtin_cd $d
    else
      commandline ''
    end
  else if [ $argv = '+' ]
    find (pwd) -type d -mindepth 1 | fzf --select-1 --exit-0 | read d
    if [ $d ]
      _builtin_cd $d
    else
      commandline ''
    end
  else
    _builtin_cd $argv
  end
end
