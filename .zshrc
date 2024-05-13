# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nano
export SUDO_EDITOR=nano

#alias ls='ls --color=auto'
#alias la='ls -lah'
#alias ll='ls -lh'
#alias ldirs='ls -ldh .*/ */'
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
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mv='mv -i -v'
alias rm='rm -i -v'
alias cp='cp -i -v'

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

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
