#!/usr/env sh


echo configuring zsh...

# powerline10k config
test -d $HOME/.config/p10k || mkdir --parents $HOME/.config/p10k
test -d $HOME/bin || mkdir --parents $HOME/bin
test -d $HOME/.local/bin || mkdir --parents $HOME/.local/bin

curl -fsSL https://git.io/antigen >"$HOME/.local/bin/antigen.zsh"
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/lean-ansi.zsh >$HOME/.config/p10k/lean-ansi.zsh
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/lean-unicode.zsh >$HOME/.config/p10k/lean-unicode.zsh
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/rainbow-ansi.zsh >$HOME/.config/p10k/rainbow-ansi.zsh
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/rainbow-unicode.zsh >$HOME/.config/p10k/rainbow-unicode.zsh
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/rainbow-dracula-ansi.zsh >$HOME/.config/p10k/rainbow-dracula-ansi.zsh
curl -fsSL https://raw.github.com/wstein/setup/develop/config/p10k/rainbow-dracula-unicode.zsh >$HOME/.config/p10k/rainbow-dracula-unicode.zsh
curl -fsSL git.io/antigen >"$HOME/.local/bin/antigen.zsh"

if ! [ -d $HOME/.config/kitty ]; then
	test -d $HOME/.config/kitty || mkdir --parents $HOME/.config/kitty
	cat <<-EOF >$HOME/.config/kitty/kitty.conf
		font_family     FiraCodeNerdFontCompleteM-Medium
		font_features   FiraCodeNerdFontCompleteM-Medium +ss04 +ss07 +zero
	EOF
fi

cat >$HOME/.zshrc <<-EOF
	source \$HOME/.local/bin/antigen.zsh

	# extend path
	export PATH="\$HOME/bin:\$HOME/.local/bin:\$PATH"

	# Load the oh-my-zsh's library.
	antigen use oh-my-zsh

	# install git-extras if not installed from package manager
	hash git-extras || antigen bundle tj/git-extras
	
	# Bundles from the default repo (robbyrussell's oh-my-zsh).
	#antigen bundle github < does not work with get-extras
	antigen bundle git
	hash git-extras && antigen bundle git-extras
	hash fossil && antigen bundle fossil
	antigen bundle docker
	antigen bundle docker-compose
	antigen bundle ripgrep
	antigen bundle tmux
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
	#alias ls=exa
	#alias open=xdg-open

	# To customize prompt, run $(p10k configure).
	if [ -n "$SSH_TTY" ] || [ "$TERM" = "linux" ] || true; then
	  source "$HOME/.config/p10k/lean-ansi.zsh"
	  # inside container?
	  if [ -n "$container" ]; then
	    typeset -g POWERLEVEL9K_DIR_FOREGROUND=5
	    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=5
	    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=5
	  fi
	else
	  source "$HOME/.config/p10k/rainbow-dracula-unicode.zsh"
	  # inside container?
	  if [ -n "$container" ]; then
	    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=5
	    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=0
	  fi
	fi
EOF