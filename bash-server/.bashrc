# ~/.bashrc

# Check and create $HOME/.local/bin directory
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p "$HOME/.local/bin"
  echo "Created $HOME/.local/bin directory"
fi

# Add $HOME/.local/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# AUTO TMUX DISABLED
# TMUX auto-attach/create session
# Only start tmux if:
# - We're in an interactive shell
# - We're not already in a tmux session
# - tmux is installed
# - We're not in VS Code terminal (optional but recommended)
#if command -v tmux &>/dev/null; then
#  # Check if we're not in VS Code terminal (optional)
#  if [ -z "$VSCODE_PID" ] && [ -z "$TMUX" ] && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]]; then
#    # Check if there are existing sessions
#    if tmux has-session 2>/dev/null; then
#      # Attach to existing session
#      exec tmux attach-session
#    else
#      # Create new session
#      exec tmux new-session
#    fi
#  fi
#fi

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Other useful aliases and functions
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable color support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
