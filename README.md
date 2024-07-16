
```bash
curl https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/setup > /tmp/setup && bash /tmp/setup
```


Manual Setup

```bash
chsh your_username -s $(which zsh) 
```

```bash
curl -o $HOME/.p10k.zsh "https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.p10k.zsh" &&\
curl -o $HOME/.zcompdump "https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.zcompdump" &&\
curl -o $HOME/.zshrc "https://raw.githubusercontent.com/farukerdem34/zsh-conf/master/.zshrc" &&\
source $HOME/.zshrc
```
