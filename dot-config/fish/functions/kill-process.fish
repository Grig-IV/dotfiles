function killProcess
    ps -u $(whoami) --no-headers -o pid,cmd
    \  | sed -E 's|/nix/store/[a-z0-9]+-||g'
    \  | sed 's/^[ \t]*//'
    \  | sk
    \  | awk '{print $1}'
    \  | xargs kill
end
