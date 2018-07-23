if [ "x$__GIT_PROMPT_DIR" == "x" ]
then
  __GIT_PROMPT_DIR=~/.bash
fi

# Colors
# Reset
ResetColor="\[\033[0m\]"       # Text Reset

# Bold

BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White
BGreen="\[\033[1;32m\]"       # Green

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
White="\[\033[0;37m\]"        # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time24="\A"
Date="\D{%d-%m-%y}"
PathShort="\w"
DirBase="\W"
User="\u"
Host="\h"
Jobs="\j"
NewLine="\n"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Default values for the appearance of the prompt. Configure at will.
GIT_PROMPT_PREFIX="("
GIT_PROMPT_SUFFIX=")"
GIT_PROMPT_SEPARATOR="|"
GIT_PROMPT_BRANCH="${BIPurple}"
GIT_PROMPT_STAGED="${Red}● "
GIT_PROMPT_CONFLICTS="${Red}✖ "
GIT_PROMPT_CHANGED="${Blue}✚ "
GIT_PROMPT_REMOTE=" "
GIT_PROMPT_UNTRACKED="…"
GIT_PROMPT_STASHED="${BIYellow}⚑ "
GIT_PROMPT_CLEAN="${BGreen}✔"

PROMPT_START="$IBlack${debian_chroot:+($debian_chroot)}[$Date $Time24]$ResetColor$Green$User$ResetColor$IGreen@$ResetColor$UGreen$Host$ResetColor$IBlack{$Jobs}$ResetColor$Yellow$PathShort$ResetColor$NewLine$IYellow$DirBase$ResetColor"
PROMPT_END="> "

function replaceSymbols() {
  # Disable globbing, so a * could be used as symbol here
  set -f

  if [[ -z ${GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING} ]]; then
    GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=L
  fi

  local VALUE=${1//_AHEAD_/${GIT_PROMPT_SYMBOLS_AHEAD}}
  local VALUE1=${VALUE//_BEHIND_/${GIT_PROMPT_SYMBOLS_BEHIND}}
  local VALUE2=${VALUE1//_NO_REMOTE_TRACKING_/${GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING}}

  echo ${VALUE2//_PREHASH_/${GIT_PROMPT_SYMBOLS_PREHASH}}

  # reenable globbing symbols
  set +f
}


function update_current_git_vars() {
  unset __CURRENT_GIT_STATUS
  local gitstatus="${__GIT_PROMPT_DIR}/gitstatus.py"

  _GIT_STATUS=$(python $gitstatus)
  __CURRENT_GIT_STATUS=($_GIT_STATUS)

  GIT_BRANCH=$(replaceSymbols ${__CURRENT_GIT_STATUS[0]} )
  GIT_REMOTE="$(replaceSymbols ${__CURRENT_GIT_STATUS[1]} )"
  if [[ "." == "$GIT_REMOTE" ]]; then
    unset GIT_REMOTE
  fi
  GIT_UPSTREAM_PRIVATE="${__CURRENT_GIT_STATUS[8]}"
  if [[ -z "${GIT_PROMPT_SHOW_UPSTREAM}" || "^" == "$GIT_UPSTREAM_PRIVATE" ]]; then
    unset GIT_UPSTREAM
  else
    GIT_UPSTREAM=${GIT_UPSTREAM_PRIVATE}
    GIT_FORMATTED_UPSTREAM="${GIT_PROMPT_UPSTREAM//_UPSTREAM_/\$GIT_UPSTREAM}"
  fi
  GIT_STAGED=${__CURRENT_GIT_STATUS[2]}
  GIT_CONFLICTS=${__CURRENT_GIT_STATUS[3]}
  GIT_CHANGED=${__CURRENT_GIT_STATUS[4]}
  GIT_UNTRACKED=${__CURRENT_GIT_STATUS[5]}
  GIT_STASHED=${__CURRENT_GIT_STATUS[6]}
  GIT_CLEAN=${__CURRENT_GIT_STATUS[7]}
}

function setGitPrompt () 
{ 
    update_current_git_vars;
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
        STATUS=" $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$ResetColor";
        if [ -n "$GIT_REMOTE" ]; then
            STATUS="$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$ResetColor";
        fi;
        STATUS="$STATUS$GIT_PROMPT_SEPARATOR";
        if [ "$GIT_STAGED" -ne "0" ]; then
            STATUS="$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$ResetColor";
        fi;
        if [ "$GIT_CONFLICTS" -ne "0" ]; then
            STATUS="$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$ResetColor";
        fi;
        if [ "$GIT_CHANGED" -ne "0" ]; then
            STATUS="$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$ResetColor";
        fi;
        if [ "$GIT_UNTRACKED" -ne "0" ]; then
            STATUS="$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$ResetColor";
        fi;
        if [ "$GIT_STASHED" -ne "0" ]; then
            STATUS="$STATUS$GIT_PROMPT_STASHED$GIT_STASHED$ResetColor";
        fi;
        if [ "$GIT_CLEAN" -eq "1" ]; then
            STATUS="$STATUS$GIT_PROMPT_CLEAN";
        fi;
        STATUS="$STATUS$ResetColor$GIT_PROMPT_SUFFIX";
        PS1="$PROMPT_START$STATUS$PROMPT_END";
    else
        PS1="$PROMPT_START$PROMPT_END";
    fi
}

PROMPT_COMMAND=setGitPrompt
