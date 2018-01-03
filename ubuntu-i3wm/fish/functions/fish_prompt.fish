function fish_prompt
    echo \n

    if test (string length (pwd)) -le 70
	set p (pwd)
    else
	set p (prompt_pwd)
    end
    echo (set_color white)(logname)':'(set_color yellow)"$p"
    echo (set_color blue)'>'(set_color green)
end
