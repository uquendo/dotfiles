BBlack='\[\033[1;30m\]'
BBlue='\[\033[1;34m\]'
BCyan='\[\033[1;36m\]'
BGreen='\[\033[1;32m\]'
BPurple='\[\033[1;35m\]'
BRed='\[\033[1;31m\]'
BWhite='\[\033[1;37m\]'
BYellow='\[\033[1;33m\]'

BIBlack='\[\033[1;90m\]'
BIBlue='\[\033[1;94m\]'
BICyan='\[\033[1;96m\]'
BIGreen='\[\033[1;92m\]'
BIPurple='\[\033[1;95m\]'
BIRed='\[\033[1;91m\]'
BIWhite='\[\033[1;97m\]'
BIYellow='\[\033[1;93m\]'

Black='\[\033[0;30m\]'
Blue='\[\033[0;34m\]'

Cyan='\[\033[0;36m\]'

Date='\D{%d-%m-%y}'
DirBase='\W'

GIT_BRANCH=master
GIT_CHANGED=0
GIT_CLEAN=0
GIT_CONFLICTS=0
GIT_PROMPT_BRANCH='\[\033[1;95m\]'
GIT_PROMPT_CHANGED='\[\033[0;34m\]✚ '
GIT_PROMPT_CLEAN='\[\033[1;32m\]✔'
GIT_PROMPT_CONFLICTS='\[\033[0;31m\]✖ '
GIT_PROMPT_PREFIX='('
GIT_PROMPT_REMOTE=' '
GIT_PROMPT_SEPARATOR='|'
GIT_PROMPT_STAGED='\[\033[0;31m\]● '
GIT_PROMPT_SUFFIX=')'
GIT_PROMPT_UNTRACKED=…
GIT_STAGED=0
GIT_UNTRACKED=1

Green='\[\033[0;32m\]'

Host='\h'
IBlack='\[\033[0;90m\]'
IBlue='\[\033[0;94m\]'
ICyan='\[\033[0;96m\]'
IFS=$' \t\n'
IGreen='\[\033[0;92m\]'

IPurple='\[\033[0;95m\]'
IRed='\[\033[0;91m\]'
IWhite='\[\033[0;97m\]'
IYellow='\[\033[0;93m\]'

Jobs='\j'

Magenta='\[\033[1;95m\]'
NewLine='\n'

On_Black='\[\033[40m\]'
On_Blue='\[\033[44m\]'
On_Cyan='\[\033[46m\]'
On_Green='\[\033[42m\]'
On_IBlack='\[\033[0;100m\]'
On_IBlue='\[\033[0;104m\]'
On_ICyan='\[\033[0;106m\]'
On_IGreen='\[\033[0;102m\]'
On_IPurple='\[\033[10;95m\]'
On_IRed='\[\033[0;101m\]'
On_IWhite='\[\033[0;107m\]'
On_IYellow='\[\033[0;103m\]'
On_Purple='\[\033[45m\]'
On_Red='\[\033[41m\]'
On_White='\[\033[47m\]'
On_Yellow='\[\033[43m\]'

PIPESTATUS=([0]="0")

PROMPT_COMMAND=setGitPrompt
PROMPT_END='> '
PROMPT_START='\[\033[0;90m\][\D{%d-%m-%y} \A]\[\033[0m\]\[\033[0;32m\]\u\[\033[0m\]\[\033[0;92m\]@\[\033[0m\]\[\033[4;32m\]\h\[\033[0m\]\[\033[0;90m\]{\j}\[\033[0m\]\[\033[0;33m\]\w\[\033[0m\]\n\[\033[0;93m\]\W\[\033[0m\]'
PS1='\[\033[0;90m\][\D{%d-%m-%y} \A]\[\033[0m\]\[\033[0;32m\]\u\[\033[0m\]\[\033[0;92m\]@\[\033[0m\]\[\033[4;32m\]\h\[\033[0m\]\[\033[0;90m\]{\j}\[\033[0m\]\[\033[0;33m\]\w\[\033[0m\]\n\[\033[0;93m\]\W\[\033[0m\] (\[\033[1;95m\]master\[\033[0m\]|…1\[\033[0m\]\[\033[0m\])> '
PS2='> '
PS4='+ '

PathShort='\w'
Purple='\[\033[0;35m\]'

Red='\[\033[0;31m\]'
ResetColor='\[\033[0m\]'

STATUS=' (\[\033[1;95m\]master\[\033[0m\]|…1\[\033[0m\]\[\033[0m\])'

Time24='\A'

UBlack='\[\033[4;30m\]'
UBlue='\[\033[4;34m\]'
UCyan='\[\033[4;36m\]'
UGreen='\[\033[4;32m\]'

UPurple='\[\033[4;35m\]'
URed='\[\033[4;31m\]'

UWhite='\[\033[4;37m\]'
UYellow='\[\033[4;33m\]'
User='\u'

White='\[\033[0;37m\]'

Yellow='\[\033[0;33m\]'

_GIT_STATUS=$'master\n.\n0\n0\n0\n1\n0'
__CURRENT_GIT_STATUS=([0]="master" [1]="." [2]="0" [3]="0" [4]="0" [5]="1" [6]="0")
__GIT_PROMPT_DIR=/home/nor/.bash

setGitPrompt () 
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
        if [ "$GIT_CLEAN" -eq "1" ]; then
            STATUS="$STATUS$GIT_PROMPT_CLEAN";
        fi;
        STATUS="$STATUS$ResetColor$GIT_PROMPT_SUFFIX";
        PS1="$PROMPT_START$STATUS$PROMPT_END";
    else
        PS1="$PROMPT_START$PROMPT_END";
    fi
}
update_current_git_vars () 
{ 
    unset __CURRENT_GIT_STATUS;
    local gitstatus="${__GIT_PROMPT_DIR}/gitstatus.py";
    _GIT_STATUS=$(python $gitstatus);
    __CURRENT_GIT_STATUS=($_GIT_STATUS);
    GIT_BRANCH=${__CURRENT_GIT_STATUS[0]};
    GIT_REMOTE=${__CURRENT_GIT_STATUS[1]};
    if [[ "." == "$GIT_REMOTE" ]]; then
        unset GIT_REMOTE;
    fi;
    GIT_STAGED=${__CURRENT_GIT_STATUS[2]};
    GIT_CONFLICTS=${__CURRENT_GIT_STATUS[3]};
    GIT_CHANGED=${__CURRENT_GIT_STATUS[4]};
    GIT_UNTRACKED=${__CURRENT_GIT_STATUS[5]};
    GIT_CLEAN=${__CURRENT_GIT_STATUS[6]}
}
