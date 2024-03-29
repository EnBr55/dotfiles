# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# removing delay for entering insert mode
KEYTIMEOUT=1

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_AU.UTF-8
export EDITOR='vim'

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
alias o="xdg-open"
alias fuck='sudo $(fc -ln -1)'
alias npmcode='code . && npm start'
alias i3config='vim ~/.config/i3/config'
alias testing='cd ~/Documents/temp/code && rm -r ~/Documents/temp/code/*'      
alias uni='cd ~/Documents/University/Courses/Units'
alias haguichi='sudo systemctl start logmein-hamachi.service && haguichi'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Open new terminal in same location
alias nt='urxvt &'
alias sqa='cd ~/Dropbox/Uni/SQA-Project/workbook'
alias cdp='cd ~/Uni/Units/INFO2222/info2222_project'
alias cdu='cd ~/Dropbox/Uni/Units'
alias timetable='feh ~/Dropbox/Uni/timetable.png &'
alias vpn='sudo openconnect vpn.sydney.edu.au'
alias qpy='bash ~/qpy.sh'
alias py='ipython --TerminalInteractiveShell.editing_mode=vi'
alias c='calcurse -D ~/Dropbox/Uni/calendar/calcurse'
alias jrl='~/jrl.sh'
alias cam='vlc v4l2://:input-slave=alsa://:v4l-vdev="/dev/video0"'
alias plan='vim ~/Dropbox/Uni/plan.md'
alias cdq='cd ~/Dropbox/Uni/Quantum'
alias qn='vim ~/Dropbox/Uni/Quantum/global_notes.md'
alias pi='pip install --user'
alias todo='~/todo.sh'

export BROWSER=firefox
#export PATH=/opt/anaconda/bin:$PATH
export TERMINFO=/usr/share/terminfo

export APT_HOME=/Applications/APT_v2.8.3
export PATH=$APT_HOME:$PATH
export APT_ARCH=LINUX

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#
phys() {
  __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
          . "/opt/anaconda/etc/profile.d/conda.sh"
      else
          export PATH="/opt/anaconda/bin:$PATH"
      fi
  fi
  unset __conda_setup
  conda activate physics
}

qutip-dev() {
  __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
          . "/opt/anaconda/etc/profile.d/conda.sh"
      else
          export PATH="/opt/anaconda/bin:$PATH"
      fi
  fi
  unset __conda_setup
  conda activate qutip-dev
}
# <<< conda initialize <<<

 export PATH="$HOME/.dynamic-colors/bin:$PATH"
 source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
 alias theme='~/Scripts/theme.sh'
 alias themes='dynamic-colors list'
 dynamic-colors switch $(cat ~/.theme)
