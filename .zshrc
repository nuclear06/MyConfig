
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/saniter/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/saniter/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/saniter/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/saniter/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ $TERM = "linux" ]];then
    # open tty2 etc. not Konsole
    ZSH_THEME="fox"
else
    # case $- in 
    #     *i*) [[ -z "$TMUX" ]] && exec byobu;;
    # esac
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    rsync
    autoswitch_virtualenv
    aliases
    alias-finder
    docker
    docker-compose
    git
    dirhistory
    emoji-clock
    encode64
    fancy-ctrl-z
    history
    kate
    qrcode
    zsh-autosuggestions
    autojump
    zsh-syntax-highlighting
    thefuck
    extract
    systemd
)
[[ -s /home/saniter/.autojump/etc/profile.d/autojump.sh ]] && source /home/saniter/.autojump/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export EDITOR=vim
export JAVA_HOME=/usr/local/java/jdk-17.0.1
# export JAVA_HOME=/usr/local/java/jdk1.8.0_351
export CLASSPATH=.:${JAVA_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
export CUDA_VISIBLE_DEVICES=0
export PATH=/usr/local/cuda-11.7/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:$LD_LIBRARY_PATH	# cuda
export PATH=/home/saniter/Programing/maven/apache-maven-3.9.6/bin/:$PATH # maven bin
export PATH=/home/saniter/.yarn/bin:${PATH}	# yarn
export PATH=/home/saniter/.local/share/JetBrains/Toolbox/scripts:$PATH	# Jetbrains Idea
export PATH=/usr/local/go/bin:$PATH
export GO111MODULE=auto
export GOPROXY="https://goproxy.io,https://mirrors.aliyun.com/goproxy/,direct"
export GOSUMDB="sum.golang.org"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

export PATH=/usr/local/Node.js/node-v18.18.2-linux-x64/bin:$PATH
alias cls=clear
alias e="eza -F --group-directories-first --icons --sort=changed -r"
alias ez="eza -F --group-directories-first -l -h --icons -a --sort=changed -r"

# alias for walk
alias lk="lk --icons"
alias fd=fdfind
alias b=byobu
alias har=harlequin

export http_proxy="http://127.0.0.1:9220"
export https_proxy="http://127.0.0.1:9220"


# Created by `pipx` on 2024-03-13 05:36:21
export PATH="$PATH:/home/saniter/.local/bin"
alias lz='lazydocker'
alias lg='lazygit'

alias sudo='sudo ' # fix sudo alias
alias sduo='sudo ' 
alias sodu='sudo '
alias sdu='sudo '
alias sud='sudo '

alias asc='asciinema rec "asciinema-$(date +%Y%m%d-%H%M%S).cast"'
alias lan="python /home/saniter/Programing/VscodeProject/lanraragi/my_script/telegra.py"

alias arc="aria2c -x 16 -s 16 -k 1M -j 16"
alias cur="curl -sSL#O"


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
compinit


export FZF_DEFAULT_COMMAND='fdfind -tf --strip-cwd-prefix --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
export FZF_DEFAULT_OPTS="--height 40% --tmux bottom,40% --info inline --border top \
    --preview-window right,3,hidden \
    --bind 'ctrl-y:execute-silent(copyq copy {} & copyq add {})+abort'
    --bind 'ctrl-/:change-preview-window(50%|hidden|)' --preview 'bat --color=always {}' \
    --bind 'ctrl-d:change-prompt(Directories> )+reload(find * -type d)' \
    --bind 'ctrl-f:change-prompt(Files> )+reload(find * -type f)'"
source <(fzf --zsh)
