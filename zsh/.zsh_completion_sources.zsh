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

if command -v rustup &> /dev/null;
then
    source <(rustup completions zsh)
fi


if command -v podman&> /dev/null;
then
    source <(podman completion zsh)
fi
