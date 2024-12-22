set -g fish_color_normal cdd6f4 # default color
set -g fish_color_command a6e3a1 # commands like echo
set -g fish_color_keyword f38ba8 # keywords like if - this falls back on the command color if unset
set -g fish_color_quote f9e2af # quoted text like abc
set -g fish_color_redirection cba6f7 # IO redirections like >/dev/null
set -g fish_color_end fab387 # process separators like ; and &
set -g fish_color_comment 6c7086 # comments like ‘# important’
set -g fish_color_error f38ba8 # syntax errors
set -g fish_color_param fab387 # ordinary command parameters
set -g fish_color_gray 6c7086
set -g fish_color_selection --background=313244 # selected text in vi visual mode
set -g fish_color_search_match --background=313244 # history search matches and selected pager items (background only)
set -g fish_color_option cba6f7 # options starting with “-”, up to the first “--” parameter
set -g fish_color_operator f5c2e7 # parameter expansion operators like * and ~
set -g fish_color_escape eba0ac # character escapes like \n and \x70
set -g fish_color_autosuggestion 6c7086 # autosuggestions (the proposed rest of a command)
set -g fish_color_cancel f38ba8 # the ‘^C’ indicator on a canceled command
set -g fish_color_cwd f38ba8 # the current working directory in the default prompt
set -g fish_color_user 94e2d5 # the username in the default prompt
set -g fish_color_host 89b4fa # the hostname in the default prompt
set -g fish_color_host_remote a6e3a1 # the hostname in the default prompt for remote sessions (like ssh)
set -g fish_color_status f38ba8 # the last command’s nonzero exit code in the default prompt

set -g fish_pager_color_progress 6c7086 # the progress bar at the bottom left corner
set -g fish_pager_color_prefix f5c2e7 # the prefix string, i.e. the string that is to be completed
set -g fish_pager_color_completion cdd6f4 # suffix of the selected completion
set -g fish_pager_color_description 6c7086 # description of the selected completion
