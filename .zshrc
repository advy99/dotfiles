source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Zsh auto-suggestions.
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme denysdovhan/spaceship-prompt
#antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

