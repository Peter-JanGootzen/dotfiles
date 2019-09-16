## Options section
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don\'t warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=500
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don\'t consider certain characters part of the word

## Alias section
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias zathura="zathura --fork"
# A great ls replacement built in Rust
alias SCHPR="cd $HOME/SCHPR/INF/"
## Search file contents, respects .gitignore
alias grop="ag --nobreak --nonumbers --noheading . | fzf"
alias cpu="watch -n.5 'cat /proc/cpuinfo | grep \"^[c]pu MHz\"'"
alias q="exit"
alias m="ncmpcpp"
# Machine specific aliases
if [[ $(uname -n) == 'SpaceMonkey' ]]; then
    alias alsamixer="alsamixer -c 0"
fi

## Plugins section: Enable fish style features
# Use syntax highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Use autosuggestion
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# vi mode
bindkey -v
#By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
#This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.
export KEYTIMEOUT=1
# FZF
## Keybindings and completion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
## Enable fd as the base find command, faster and respects .gitignore, --type f set the search mode to only files
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Theme
[ -f $HOME/.config/zsh/themes/minimal/minimal.zsh ] && source $HOME/.config/zsh/themes/minimal/minimal.zsh
# Plugins
## fzf cd plugin, use tab
[ -f $HOME/.config/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh ] && source $HOME/.config/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh


# F12 - Clear the Screen
bindkey "^[[24~" clear-screen

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=gtk2
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=/usr/bin/firefox
export ANDROID_HOME=$HOME/Android/Sdk/
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
# Add ruby gem bins
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH
# Add composer(php) bin folder to the path
export PATH=$HOME/.config/composer/vendor/bin:$PATH
# Add my bin folder to the path
export PATH=$HOME/bin:$PATH
# Add dotnet core tools to the path
export PATH="$PATH:$HOME/.dotnet/tools"
export WINEARCH=win32
export WINEPREFIX=$HOME/.wine
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=$HOME/.android/sdk
# Disable the stupid dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# Add npm bins to the path
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=$HOME/.node_modules
# Add user installed Python packages
export PATH="$HOME/.local/lib/python3.7/site-packages:$PATH"
# Add cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"
# Machine specific variables
if [[ $(uname -n) == 'SpaceMonkey' ]]; then
    export MUSIC=/mnt/storage/Media/Music
fi

if [ $(tty) = "/dev/tty1" ]; then
    exec startx
elif [[ $(tty) == "/dev/tty2" ]]; then
    exec nvidia-xrun
elif [[ $(tty) == "/dev/tty"* ]]; then
    cowsay "What are you doing here?"
fi

