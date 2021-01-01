source $HOME/.local/bin/antigen.zsh

# helper to check if command is available
isvalid() {
 	command -v $1 >/dev/null
}

# helper to define alias, only if target command is available
myalias() {
	typeset ALIAS=$(cut -d= -f1 <<<$1)
	typeset COMMAND=$(cut -d= -f2- <<<$1)
	isvalid $COMMAND && alias $ALIAS=$COMMAND
}

# extend path
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle github < does not work with get-extras
antigen bundle git
isvalid git-extras && antigen bundle git-extras
isvalid fossil && antigen bundle fossil
isvalid docker && antigen bundle docker
isvalid docker-compose && antigen bundle docker-compose
isvalid ripgrep && antigen bundle ripgrep
isvalid tmux && antigen bundle tmux
antigen bundle command-not-found

# Load the zsh-users bundles.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# other bundles.
antigen bundle denysdovhan/gitio-zsh
antigen bundle nvie/git-toolbelt
antigen bundle wstein/git-toolbelt-zsh

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# aliases
myalias ls=exa
myalias vim=nvim
myalias open=xdg-open

# To customize prompt, run $(p10k configure).
if [ -n "$SSH_TTY" ] || [ "$TERM" = "linux" ]; then
    source "$HOME/.config/p10k/lean-ansi.zsh"
    if [ -f /.dockerenv ]; then
        # docker container
        typeset -g POWERLEVEL9K_DIR_FOREGROUND=33
        typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=33
        typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=33
    elif [ -f /run/.containerenv ]; then
        # podman container
        typeset -g POWERLEVEL9K_DIR_FOREGROUND=9
        typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=9
        typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=9
    else
        # no container
        typeset -g POWERLEVEL9K_DIR_FOREGROUND=4
        typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=4
        typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=4
    fi
else
    source "$HOME/.config/p10k/rainbow-dracula-unicode.zsh"
    if [ -f /.dockerenv ]; then
        # docker container
        typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=33
        typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=0
    elif [ -f /run/.containerenv ]; then
        # podman container
        typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=9
        typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=0
    fi
fi

