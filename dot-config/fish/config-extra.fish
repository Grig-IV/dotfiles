function setup_hm_session_vars
    if [ -n "$__SESS_VARS_SOURCED" ]
        return
    end
    set -gx __SESS_VARS_SOURCED 1

    set -gx PATH "$PATH"(test -n "$PATH" && echo ':' || echo)"$GOBIN"':'"$HOME"'/.local/bin'

    set -gx XDG_CACHE_HOME '/home/grig/.cache'
    set -gx XDG_CONFIG_HOME '/home/grig/.config'
    set -gx XDG_DATA_HOME '/home/grig/.local/share'
    set -gx XDG_STATE_HOME '/home/grig/.local/state'

    set -gx EDITOR hx

    set -gx CONFIG "$HOME/.config"
    set -gx MIND "$HOME/mind"
    set -gx NVIMCONF "$CONFIG/nvim"
    set -gx NIXCONF /etc/nixos

    set -gx SKIM_DEFAULT_OPTIONS '--color=fg:#cdd6f4,bg:empty,matched:#89dceb,matched_bg:#1e1e2e,current:#fab387,current_bg:#313244,current_match:#1e1e2e,current_match_bg:#89dceb,spinner:#a6e3a1,info:#bac2de,prompt:#cdd6f4,cursor:#fab387,selected:#eba0ac,header:#94e2d5,border:#6c7086 --bind \'ctrl-q:abort\''
end
setup_hm_session_vars

status is-interactive; and begin
    direnv hook fish | source
    source "$CONFIG/fish/colors.fish"

    # binds
    bind \cq exit
    bind \cf findAndEdit
    bind \ck killProcess
    bind \cl 'clear; commandline -f repaint'
    bind \cr 'run; commandline -f repaint'

    # shortcuts
    abbr -a gc 'cd $CONFIG'
    abbr -a gd 'cd $CONFIG/dotfiles'
    abbr -a gs 'cd $HOME/sources'
    abbr -a gl 'cd $HOME/.local'
    abbr -a gx 'cd $NIXCONF'
    abbr -a glb 'cd $HOME/.local/bin'

    abbr -a c 'jump -d $CONFIG; yacd'
    abbr -a s 'jump -d $HOME/sources/; yacd'
    abbr -a d 'jump -dr $CONFIG/dotfiles; yacd'
    abbr -a t 'jump -d $HOME/media/T7/torrents'

    abbr -a cp 'cp -ivr'
    abbr -a mv 'mv -iv'
    abbr -a rm 'rm -vI'
    abbr -a mkdir 'mkdir -pv'
    abbr -a bc 'bc -ql'
    abbr -a ls 'ls -la'

    abbr -a grep 'grep --color=auto'
    abbr -a diff 'diff --color=auto'
    abbr -a ip 'ip -color=auto'

    # neovim
    abbr -a gn 'cd $CONFIG/nvim'
    abbr -a n 'jump -r $CONFIG/nvim'

    # nix
    abbr -a hms "home-manager switch --flake \$NIXCONF#$(whoami)@$(hostname)"
    abbr -a nrs "sudo nixos-rebuild switch --flake \$NIXCONF#$(hostname)"
    abbr -a nd 'nix develop'
    abbr -a lu 'nix flake lock --update-input'
    abbr -a x 'jump -r $NIXCONF'

    # go
    abbr -a gmt 'go mod tidy'
    abbr -a gmi 'go mod init'

    # wsl
    abbr -a gw 'cd /mnt/c/Users/grig'
    abbr -a gwdl 'cd /mnt/c/Users/grig'
    abbr -a pwsh 'powershell.exe'
    abbr -a pwshc 'powershell.exe -Command'

    # notes
    abbr -a m 'cd $MIND & $EDITOR context.md'
    abbr -a gm 'cd $MIND'

    # lf
    function lfcd
        cd $(lf -print-last-dir)
    end
    bind \cl 'lfcd; commandline -f execute'

    # yazi
    function yacd
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    bind \ce 'yacd; commandline -f execute'

    # misc
    abbr -a stw 'stow --dotfiles --no-folding -t $HOME -d $CONFIG -S dotfiles'
    abbr -a tlm 'tmuxp load -y main'
end
