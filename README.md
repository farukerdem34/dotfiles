```bash
sudo apt-get install zsh -y &&\
sudo chsh -s /bin/zsh $USER
```

```bash
curl https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/setup | zsh 
```
``bash
curl -o $HOME/.vimrc https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.vimrc &&\
mkdir -p $HOME/.vim/autoload &&\
mkdir -p $HOME/.vim/bundle &&\
mkdir -p $HOME/.vim/pack &&\
mkdir -p $HOME/.vim/plugged &&\
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
echo "Plug 'morhetz/gruvbox'" >> $HOME/.vimrc &&\
vim -c "PlugInstall"
```
