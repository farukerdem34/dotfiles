# Dependecies

```bash
sudo apt update -y;sudo apt upgrade -y;sudo apt install stow neovim tmux bat fzf git gcc -y
```

```bash
sudo pacman -Syu --noconfirm --color always stow neovim tmux bat fzf git gcc
```

# Dotfiles

```bash
git clone https://github.com/farukerdem34/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles/
stow bat fastfetch kitty nvim tmux vimrc zsh
```
