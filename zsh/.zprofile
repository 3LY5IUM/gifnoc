export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Users/admin/homebrew/bin"
# to put brew bin in path
export PATH=$HOME/homebrew/bin:$PATH
# adding more to path
# the one below already gets added
# export PATH="$PATH:/Users/elysium/.local/bin"
#this path is anyway added by /etc/path by apple. used for safari drivers and shit.
#export PATH="$PATH:/System/Cryptexes/App/usr/bin"
export PATH="$PATH:/Users/elysium/.cargo/bin"
#go install dir ( used last for bootdev)
export PATH=$PATH:$HOME/go/bin


# for ruby apps installed using gem
export PATH="$PATH:/Users/elysium/homebrew/lib/ruby/gems/3.4.0/bin"

eval $(/Users/elysium/homebrew/bin/brew shellenv)


# this fixes the problem of remanant characters for auto complete and suggestion
export LC_ALL=en_US.UTF-8



# for ollmaa modles location
export OLLAMA_MODELS=/Volumes/StarScream/ollama

# homebrew

# this installs stuff in home applications instead of the sys applications thus not req sudo premissions for non admin acc
# changing fondir to directly use brew to install font and to have to give --fontdir dir flag while installing.
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=~/Library/Fonts"

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BAT=1
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_VERBOSE=1

# this is for gpg passphrase coz it freaks out when done in tmux
export GPG_TTY=$(tty)

# setting default editor.
export EDITOR=nvim

#fzf
#for the omz fzf plugin acc to omz plugin info fzf
export FZF_BASE=/Users/titan/homebrew/bin/fzf
DISABLE_FZF_AUTO_COMPLETION="false"


HISTSIZE=10000000
SAVEHIST=10000000
