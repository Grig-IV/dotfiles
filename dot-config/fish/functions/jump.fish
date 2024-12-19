function jump
    argparse -N 1 d/dir r/recursive -- $argv
    or return

    set find_args --max-depth 1

    if set -q _flag_recursive
        set find_args
    end

    if set -q _flag_dir
        set -a find_args --type dir
    else
        set -a find_args --type f
    end

    cd (string replace '~' $HOME $argv)

    set selection (command fd . $find_args | sk)
    if test -z "$selection"
        echo "No selection"
        cd -
        return
    end


    if set -q _flag_dir
        cd $selection
    else
        $EDITOR ./$selection
    end
end
