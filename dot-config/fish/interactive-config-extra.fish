abbr -a gc 'cd $HOME/.config'
abbr -a gd 'cd $HOME/.config/dotfiles'
abbr -a gn 'cd $HOME/.config/nvim'
abbr -a gs 'cd $HOME/sources'
abbr -a gx 'cd $NIXCONF'

abbr -a stw 'stow --dotfiles --no-folding -t $HOME -d $HOME/.config -S dotfiles'
abbr -a tlm 'tmuxp load -y main'

abbr -a gmt 'go mod tidy'
abbr -a gmi 'go mod init'

bind \cq exit
bind \cl 'clear; commandline -f repaint'
bind \cr 'run; commandline -f repaint'


function lfcd
    cd $(lf -print-last-dir)
end

bind \cl 'lfcd; commandline -f execute'

set -gx EDITOR hx
set -gx GOPATH $HOME/.local/go
set -gx GOBIN $HOME/.local/go/bin
