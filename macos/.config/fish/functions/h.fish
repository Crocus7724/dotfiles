function fzf_select_history
    history|fzf --exit-0 --select-1 --query (commandline) |read slct
  if [ $slct ]
    commandline $slct
  end
  
  commandline -f repaint
end

function h
  fzf_select_history
end
