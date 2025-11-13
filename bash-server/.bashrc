# ~/.bashrc

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Check and create $HOME/.local/bin directory
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p "$HOME/.local/bin"
  echo "Created $HOME/.local/bin directory"
fi

# Add $HOME/.local/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Install starship if not installed
if ! command -v starship &>/dev/null; then
  echo "Starship not found. Installing..."
  curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/.local/bin"

  # Verify installation
  if command -v starship &>/dev/null; then
    echo "Starship installed successfully"
  else
    echo "Failed to install starship"
  fi
fi

# Initialize starship if available
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
else
  echo "Starship not available, using default prompt"
  # Fallback to basic prompt
  PS1='[\u@\h \W]\$ '
fi

# Check and create starship config directory
if [ ! -d "$HOME/.config/starship" ]; then
  mkdir -p "$HOME/.config/starship"
  echo "Created $HOME/.config/starship directory"
fi

# Download starship.toml if it doesn't exist
if [ ! -f "$HOME/.config/starship/starship.toml" ]; then
  echo "Downloading starship.toml configuration..."
  if command -v curl &>/dev/null; then
    curl -sS -o "$HOME/.config/starship/starship.toml" \
      "https://github.com/farukerdem34/dotfiles/raw/refs/heads/master/starship/.config/starship.toml"

    if [ $? -eq 0 ] && [ -f "$HOME/.config/starship/starship.toml" ]; then
      echo "Starship configuration downloaded successfully"
    else
      echo "Failed to download starship configuration"
    fi
  else
    echo "curl not available, cannot download starship configuration"
  fi
fi

# TMUX auto-attach/create session
# Only start tmux if:
# - We're in an interactive shell
# - We're not already in a tmux session
# - tmux is installed
# - We're not in VS Code terminal (optional but recommended)
if command -v tmux &>/dev/null; then
  # Check if we're not in VS Code terminal (optional)
  if [ -z "$VSCODE_PID" ] && [ -z "$TMUX" ] && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]]; then
    # Check if there are existing sessions
    if tmux has-session 2>/dev/null; then
      # Attach to existing session
      exec tmux attach-session
    else
      # Create new session
      exec tmux new-session
    fi
  fi
fi

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

# Some more ls aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
