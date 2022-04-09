#
# .zshrc
#
# @author Vincent Klingemann


## Set Variables

export DEVKIT_LOCATION="~/usr/local/bin/mayaDevKit";
export MAYA_LOCATION="/Applications/Autodesk/maya2020";

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800


export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

export MDI_DIR="~/Nextcloud/Documents/Studium\ MDI/"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Change ZSH Options

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# Set architecture-specific brew share path.
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
    share_path="/opt/homebrew/share"
else
    echo "Unknown architecture: ${arch_name}"
fi

# Create Aliases
alias ls='ls -lAFh'

## Git Aliases
alias gs='git status'
alias gc='git commit'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Customize Prompt(s)
PROMPT=$'\n'"%(?.%F{green} MBP-2014.%F{red} MBP-2014)%F{white} %3~ %F{white}"$'\n'" %1~ %L "

RPROMPT='%*'

promt_dir() {
 promt_segment blue $CURRENT_FG '%2~'
}

# Add Locations to $PATH Variables
## Setting CLASSPATH for Java


## Functions
# Create and enter a directory
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Start Global Protect
function startGP() {
  launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*;
}

# Stop Global Protect
function stopGP() {
  launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp* 2>/dev/null;
}

# Enter a running Docker container.
function denter() {
  if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
  fi

  docker exec -it $1 bash
  return 0
}

# Git upstream branch syncer.
# Usage: gsync main (checks out main, pull upstream, push origin).
function gsync() {
  if [[ ! "$1" ]] ; then
    echo "You must supply a branch."
    return 0
  fi

  BRANCHES=$(git branch --list $1)
  if [ ! "$BRANCHES" ] ; then
    echo "Branch $1 does not exist"
    return 0
  fi

  git checkout "$1" && \
  git pull upstream "$1" && \
  git push origin "$1"
}

# Use ZSH Plugins
plugins=(git brew history history-substring-search)

# ...and Other Surprises
