# Display time
SPACESHIP_TIME_SHOW=true

# Hide system nodejs version
SPACESHIP_NODE_DEFAULT_VERSION=$(node --version)

# This sets host to be always displayed
SPACESHIP_HOST_SHOW=true

# Shows cached sudo privileges
SPACESHIP_SUDO_SHOW=true
SPACESHIP_SUDO_SYMBOL="󰦣"

SPACESHIP_BATTERY_THRESHOLD=100

# Git symbols
SPACESHIP_GIT_BRANCH_PREFIX=" "

SPACESHIP_PROMPT_ORDER=(
  host           # Hostname section
  dir            # Current directory section
  package        # Package version
  node           # Node.js section
  python         # Python section
  golang         # Go section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  docker         # Docker section
  docker_compose # Docker section
  azure          # Azure section
  venv           # virtualenv section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  git            # Git section (git_branch + git_status)
  battery        # Battery level and status
  time           # Time stamps section
)
