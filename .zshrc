# zsh key bindings
[ -f .zshbindings ] && source .zshbindings

# starship.rs
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# quality of life aliases
#alias ls='ls --color=auto'
#alias la='ls -lah'
#alias ll='ls -lh'
#alias ldirs='ls -ldh .*/ */'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias mv='mv -i -v'
alias rm='rm -i -v'
alias cp='cp -i -v'
alias history='history 1'

# modern unix aliases
alias ls='lsd'
alias la='lsd -lA'
alias ll='lsd -l'
alias cat='bat'
alias du='dust'
alias df='duf'
alias find='fd'
alias top='btm'
#alias ping='gping'
#alias ps='procs'

# custom aliases
alias fastfetch='fastfetch --logo-padding-top 2'

# environment variables
export EDITOR=nano
export SUDO_EDITOR=nano
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# custom functions
gpg-encrypt () {
  keyid=0x0000000000000000
  output=~/"${1}".$(date +%s).enc
  gpg --encrypt --armor --output ${output} \
    -r $keyid "${1}" && echo "${1} -> ${output}"
}

gpg-decrypt () {
  output=$(echo "${1}" | rev | cut -c16- | rev)
  gpg --decrypt --output ${output} "${1}" && \
    echo "${1} -> ${output}"
}

switch-yubikeys () {
  #read -p "Insert the Yubikey you want to use ....  "   ignore
  #echo "Switching GPG to backup Yubikey ..."
  gpg-connect-agent "scd serialno" "learn --force" /bye
}

# zsh stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
