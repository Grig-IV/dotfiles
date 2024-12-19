function findAndEdit
    set selected_file (fd | sk)

    if test -n "$selected_file"
        $EDITOR "$selected_file"
    else
        echo "No file selected."
    end
end
