function fish_prompt
    if test (expr (string length (pwd)) + (string length (logname))) -lt $COLUMNS
      set current_directory (pwd)
    else
      set current_directory (prompt_pwd)
    end
    echo \n
    echo (set_color cyan)(logname)(set_color white)':'(set_color yellow)$current_directory
    echo (set_color magenta)'>'(set_color green)
end
