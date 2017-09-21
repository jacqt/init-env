# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="risto"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=":$HOME/.local/bin:$HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# if [[ ! $TERM =~ screen ]]; then
#   exec tmux
# fi

export EDITOR="v"
. /home/anthony/.jarvis_config/jarvis

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# # Add hook for autocorrect.
if [ -n "$ZSH_VERSION" ]; then
  alias __hist_last_cmd__="fc -ln -1"
else
  alias __hist_last_cmd__="history 1 | cut -c 8-"
fi
function __prompt_command {
  local EXIT="$?"

  local HISTTIMEFORMAT=""
  HISTCMD_previous=$(__hist_last_cmd__)

  # Only consider errors where the exit status of 127 indicates
  # "Command not found".
  if [[ $EXIT -eq "127" ]]; then
    if [[ $HISTCMD_previous != "$HISTCMD_last" ]]; then
      HISTCMD_last=$HISTCMD_previous
      source autocorrect "$HISTCMD_previous" "$EXIT"
    fi
  fi

  # Change the title of the terminal window to the current directory.
  printf "\033]0;%s\007" "${PWD/#$HOME/~}"

  HISTCMD_last=$HISTCMD_previous
}
export HISTFILE="$HOME/.zsh_history"
export PROMPT_COMMAND="__prompt_command"

# Zsh-specific hooks
function precmd {
  eval "$PROMPT_COMMAND"
}
export SAVEHIST="10000000"

panewrap () { printf "\033]2;%s\033\\" "$1"; "$@";   printf "\033]2;%s\033\\" "zsh" }
export EDITOR=v

v() {
  if [ -z $NVIM_LISTEN_ADDRESS ]; then
    panewrap nvim $@
  else
    nvr $@
  fi
}
