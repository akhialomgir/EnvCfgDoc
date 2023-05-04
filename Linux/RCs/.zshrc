# Encoding issue
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# autoload -Uz promptinit
autoload -U colors && colors
PROMPT="%{$fg[yellow]%}%n%{$reset_color%}: %{$fg[blue]%}%1~ %{$reset_color%}%# "

# zsh suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# DISPLAY
export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')
#export DISPLAY=127.0.0.1:0.0
export DISPLAY="$HOST_IP:0.0"

# socket
#export https_proxy="http://$HOST_IP:7890"
#export http_proxy="http://$HOST_IP:7890"

# export
export PATH=/home/akhia/.local/bin:$PATH

# shell title
echo -e "\033];Arch\007"
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# NVM export
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby export
export PATH=/home/akhia/.local/share/gem/ruby/3.0.0/bin:$PATH
