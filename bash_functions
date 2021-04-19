#
. "$HOME/workspace/dotfiles/bash_colors"
. "$HOME/workspace/dotfiles/git-prompt.sh"

# Public: Verifies if a command exists on the system
#
# Takes a arbitary binary or file an verifies if that file exists
#
# $1 - File to verify
#
# Examples
#   command_exits foo
#
# Produces an exit code of 0 if command exists
command_exists() {
  # shellcheck disable=SC2039
  type "$1" &> /dev/null ;
}


update-ssh-socket(){
    SSH_AUTH_SOCK=$(find /tmp/ssh* -uid "$(id -u)" -type s -name agent.\* -printf '%C@ %p\n' 2>/dev/null | sort | tail -n1 |cut -d' ' -f2)
    export SSH_AUTH_SOCK
    echo "Socket updated to $SSH_AUTH_SOCK"
}
update-ssh-socket

# Public: Alternative man command
#
# Overwrites the man command with some color enhancements
man() {
  # shellcheck disable=SC2046
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;94m") \
    LESS_TERMCAP_md=$(printf "\e[1;94m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


# Public: Backup up File
#
# Creates a copy of a file with the current timestamp preceding the filename
#
# $1 - File to backup
#
# Examples
#   buf my_filename.txt
#
# Creates a backup of `filename.txt` to `20200101-12_00-filename.txt`
buf() {
  test -f "$1" || echo "$1 does not exist" && return 1
  cp "$1" "$(date +%Y%m%d-%H_%M)-$1";
}


# Fetch last exit code and produce either checkmark or crossmark depndening on
# the exit-code
exit_code() {
  if [ $? -eq 0 ]; then
    echo "${GREEN112}✓${RESET}"
  else
    echo "${RED}❌${RESET}"
  fi
}


# Public: Prompt Command for PS1
prompt_command_function() {
  EXIT_CODE=$(exit_code)
  SIZE="$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')"
  GIT_PS1_DESCRIBE_STYLE="contains"
  GIT_BRANCH=$(__git_ps1)  # Using bash-git-prompt https://github.com/magicmonty/bash-git-prompt

  PS1_LINE1="${RESET}${BAR}┌(${BLUE111}\u@\h${BAR})─(${YELLOW220}\j${BAR})─(${WHITE}\t${BAR})${RED}${GIT_BRANCH}${RESET}"
  PS1_LINE2="${RESET}${BAR}└─(${GREEN112}\w${BAR})─(${GREEN112}${SIZE}${BAR})-(${EXIT_CODE}${BAR})──> ${RESET}$ "
  PS1="$PS1_LINE1\n$PS1_LINE2"
}

