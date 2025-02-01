<div align="center">
<img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black"> </img> <img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white"> </img> <img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white"></img> <img src="https://img.shields.io/badge/VIM-%2311AB00.svg?&style=for-the-badge&logo=vim&logoColor=white"></img> <img src="https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white"> </img>
</div>




# Installing And Setting ZShell As Default Shell

<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white"> </img>

```bash
sudo apt-get install zsh -y &&\
sudo chsh -s /bin/zsh $USER
```
<img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white"></img>

# Installation Script (All Vim, Tmux, ZShell Included)
```bash
curl https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/setup | zsh 
```

<img src="https://img.shields.io/badge/VIM-%2311AB00.svg?&style=for-the-badge&logo=vim&logoColor=white"></img>

# Vim Configurations
```bash
curl -o $HOME/.vimrc https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.vimrc 
```

<img src="https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white"> </img>

# Tmux Configurations
```
curl -o $HOME/.tmux.conf "https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.tmux.conf"
```

# Kitty Configurations
```bash
mkdir -p $HOME/.config/kitty
curl -o $HOME/.config/kitty/dark-theme.auto.conf https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/kitty/dark-theme.auto.conf &&\
curl -o $HOME/.config/kitty/kitty.conf https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/kitty/kitty.conf &&\
```
