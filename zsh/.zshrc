# to measure the speed and time for shell startup.
zmodload zsh/zprof
export XDG_CONFIG_HOME="$HOME/gifnoc/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/cache"
export SASL_PATH="$(brew --prefix cyrus-sasl)/lib/sasl2"

# for java runtime to be found. uses openjdk from homebrew.
export PATH="/Users/elysium/homebrew/opt/openjdk/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# for zulip
export ZT_NOTIFICATION_SOUND=Submarine

#functions
function update(){
	brew update && brew upgrade;
	omz update;
	/Users/elysium/Library/Application Support/Firefox/Profiles/sbwmf28f.arkenfox-daily-plugins-1743201435664/updater.sh
	pipx upgrade-all;
}

function _gen_fzf_default_opts() {
local darker="235"
local darkest="234"
export FZF_DEFAULT_OPTS="
  --color fg:$darkest,bg:-1,hl:7,fg+:15,bg+:$very_dark,hl+:7
  --color info:$darker,prompt:15,pointer:15,marker:15,spinner:$darker
  --no-bold
"
}


function fman() {
    local selected
    selected=$(compgen -c | grep -v "^_.*" | sort -ur | fzf --preview 'man {} 2>/dev/null | head -200' \
               --preview-window=right:50%:wrap \
               --prompt="Manual: " \
               --header="Press ENTER to open manual page") && man "$selected"
}

# function reminder()

# function emartell(){
# diskutil eject $(diskutil list | grep martell | grep -Eo disk.s. ); }

# function martell(){
# diskutil mount  $(diskutil list | grep martell | grep -Eo disk.s. ) }

function cchat(){
	printf "%s" 'enter your query: '
	read query
	# Use process substitution instead of pipes
	curl "ch.at/?q=$(jq -sRr @uri <<< "$query")"
}

# Lazy load conda
function conda() {
    echo "Lazy loading conda upon first invocation..."
    unset -f conda
    # Run the original conda init code
    __conda_setup="$('/Users/elysium/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/elysium/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/Users/elysium/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/Users/elysium/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    # Run the original conda command with all arguments
    conda "$@"
}


# change the default location for the config.
ZDOTDIR="$HOME/gifnoc/zsh/"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
# for docker to know where to check for colima socket.
export DOCKER_HOST="unix://${XDG_CONFIG_HOME:-$HOME/.config}/colima/default/docker.sock"

# omz default 
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="minimal_clean_custom"
# ZSH_THEME="clean"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
#DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/gifnoc/.oh-my-zsh/custom/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=( macos you-should-use fzf)


#custum search engine
#ZSH_WEB_SEARCH_ENGINES=(
#    reddit "https://www.reddit.com/search/?q="
#    lookmovies "https://lookmovie.la"
#    youtube "https://www.youtube.com/results?search_query="
# not require after surfraw.
#)

# Plugin config

# zsh-auto-suggestion
# auto-suggestion is installed using brew so that i can update it....not just cloning it into custom folder...
# if done that way i would if have just added it to plugins=(..)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh-syntax-highlighting 
#To activate the syntax highlighting, add the following at the end of your .zshrc:
source /Users/elysium/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#If you receive "highlighters directory not found" error message,
#you may need to add the following to your .zshenv:
#export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/Users/elysium/homebrew/share/zsh-syntax-highlighting/highlighters


# zsh-completion (for more tab-completions)
# To activate these completions, add the following to your .zshrc:

#  if type brew &>/dev/null; then
#    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#    autoload -Uz compinit
#    compinit
#  fi


ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
setopt RM_STAR_WAIT

#export HISTSIZE=32768;
#export HISTFILESIZE=$HISTSIZE;
#export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim ~"
alias cda="cd ~/Applications/"
alias null_pointer='gcurl -sS -F "file=@$(fzf)" https://0x0.st | pbcopy'
alias gcurl="~/homebrew/opt/curl/bin/curl"
alias cdc="cd ~/Desktop/code"
alias firefox-update="bash /Users/titan/Library/Application\ Support/Firefox/Profiles/jpvxf970.default-release/updater.sh"
alias music="iina --music-mode https://live.musopen.org:8085/streamvbr0"
alias rss="newsboat"
alias notes="sh ~/.dotfiles/notes.sh"
alias todo="nvim ~/logseq/pages/TODO.md"
# alias fman="compgen -c| fzf | xargs man"
alias tl="tsm -l"
alias pip="pip3"
alias cdd="cd ~/Desktop"
alias typefortune="typefortune -s"
alias vpn='open -a protonvpn.app'
alias zshrc="cd && nvim .zshrc && source .zshrc"
alias ss="open -a ScreenSaverEngine"
alias hmm="genact --exit-after-time 100sec"
#alias swa="open -a "Spotify"  && open /Applications/MuteSpotifyAds.app"
#jalias s="spotify"
alias lyrics="swaglyrics -t "
alias tsm="transmission-remote"
alias mstak-view="open https://www.memorystack.live"
#alias minecraft="open /Applications/Minecraft.jar "
alias wr="wifi restart"
# alias ls='la -G'
alias vimrc="nvim ~/.vimrc"
alias q="exit"
alias dns="sudo nextdns start"
alias nodns="sudo nextdns stop"
#alias n="music next"
#alias k="music pause"
#alias kk="music play"
#alias sq="music quit"
#alias sre="music replay"
alias dnsrestart="sudo nextdns restart"
#alias audio="afplay"
alias dnsstat="sudo nextdns status"
alias superdns="sudo nextdns stop && cd && sudo ./dnscrypt-proxy-macos_arm64-2.1.1/dnscrypt-proxy"
#alias trash="trash -F"
alias cddot="cd ~/gifnoc"
alias mv='mv -i'
alias gs='git status'
alias addtomusic="mv ~/Music/ToMoveToAutoAdd/* ~/Music/Music/Media.localized/Automatically\ Add\ to\ Music.localized"

alias vim=nvim
alias league='cd "/Users/elysium/Applications/League of Legends.app/Contents/LoL"; ./LeagueClient.app/Contents/MacOS/LeagueClient'


# this is for run-help to get help form shell-builtin stuff
# unalias run-help
# HELPDIR="/usr/share/zsh/5.9/help/"
# autoload run-help






_gen_fzf_default_opts

# preview for ctrl-t
export FZF_CTRL_T_OPTS="--preview '(bat --paging=never --color=always --style=plain --theme=base16 {} 2>/dev/null || tree -C {}) 2> /dev/null | head -200'"
# give a tree preview for folders
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# for completion
export FZF_COMPLETION_TRIGGER='**' 


# cutom scripts calling
#neofetch --ascii skull2.txt| lolcat
#fortune -a | lolcat
#echo "homecoming: $(($homecoming-$today))days $((24-$t_hour))hours $((60-$t_min))min $((60-$t_sec))sec."|lolcat
{ fastfetch --file $XDG_CONFIG_HOME/ascii_art/skull.txt; echo " "; echo "Every time I'm faced with a decision,\nI close my eyes and see the same picture. Whenever I consider an action, \nI ask myself, 'will this action help to make this picture reality?'\nPull it out of my mind and into the world, \nand I only act if the answer is yes."} | lolcat
	#sh ~/.scripts/homecoming.sh



#trying better completion
# Performance-optimized completion initialization
# no need to call compint coz it is called with oh-my-zsh.
# autoload -Uz compinit

# Only rebuild cache if it doesn't exist or is older than 24 hours
# if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    # compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
# else
    # compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"
# fi
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C

# Standard style used by default for 'list-colors'
LS_COLORS=${LS_COLORS:-'di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'}

# apply ls colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# pretty cd [tab] stuffs
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# highlight case in select
zstyle ':completion:*' menu select

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/cache/.zcompcache"

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion. But allow ignoring custom entries from static
# */etc/hosts* which might be uninteresting.
zstyle -e ':completion:*:hosts' hosts 'reply=(
	${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
	${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
		${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
	)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
	adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
	dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
	hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
	mailman mailnull mldonkey mysql nagios \
	named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
	operator pcap postfix postgres privoxy pulse pvm quagga radvd \
	rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
	zstyle ':completion:*:*:kill:*' menu yes select
	zstyle ':completion:*:*:kill:*' force-list always
	zstyle ':completion:*:*:kill:*' insert-ids single

# Man
# enable completion on manual page
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
# zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:man:*'      menu yes select

# SSH/SCP/RSYNC
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

fpath=(~/homebrew/share/zsh-completions $fpath)
fpath=(~/gifnoc/.oh-my-zsh/custom/completions $fpath)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.9/contrib/zsh $fpath)

# Initialize the completion system
# This must come AFTER all fpath modifications.
autoload -Uz compinit

# The following lines create a cache of completions to speed up shell startup.
# It will only regenerate the cache file (~/.zcompdump) if it's older than 24 hours
# or if new completion scripts are detected.
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -i
else
  # -C tells compinit to check for new functions and files before creating the cache.
  compinit -C
fi



source $ZSH/oh-my-zsh.sh
# this source stament needs to be at the last otherwise it cause errors


fpath+=~/.zfunc; autoload -Uz compinit; compinit
