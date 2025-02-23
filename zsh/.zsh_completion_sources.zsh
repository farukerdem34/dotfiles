# Completion Sources
if  command -v kubectl &> /dev/null;
then 
    source <(kubectl completion zsh)
fi

if  command -v hcloud &> /dev/null;
then 
    source <(hcloud completion zsh)
fi

if command -v fzf &> /dev/null;
then
    source <(fzf --zsh)
fi

if command -v docker &> /dev/null;
then
    source <(docker completion zsh)
fi

if  command -v gh &> /dev/null;
then 
    source <(gh completion -s zsh)
fi

