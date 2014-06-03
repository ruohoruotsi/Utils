#
# iroro productivity mods - 2013-05-25
#

echo -n "Uptime: "; uptime
echo ""

MYNAME='iroro'
export MYNAME


PS1="iroro:\w$ "

# Add terminal colors                                                                                                                                                                                  
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GFh'

# Tell grep to highlight matches                                                                                                                                                                       
export GREP_OPTIONS='--color=auto'


if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Add Mac Ports bin, Android SDK, NDK to path                                                                                                                                                          
PATH=${PATH}:/opt/local/bin:~/dev/Android/android-sdk-macosx/platform-tools:~/dev/Android/android-sdk-macosx/tools:~/dev/Android/android-ndk-r9b 
PATH=/usr/local/git/bin:${PATH}

# added by Anaconda 1.9.1 installer
export PATH="/Users/iorif/anaconda/bin:$PATH"
export PATH="//anaconda/bin:$PATH"




# must use double-quotes when calling a shell variable
# export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# export LESS='-M'

export HISTSIZE=10000  # 500 is default, 0 will disable history
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '
#export HISTCONTROL=ignoredups
#export HISTCONTROL=ignorespace
export HISTCONTROL=ignoreboth
export HISTIGNORE="history:pwd:ls:ls -la:ll"

export ECHO_NEST_API_KEY=2VN1LKJEQUBPUKXEC

alias ll='ls -lahG'
alias home='cd ~'
alias up='cd ..'
alias h='history'

# can also redefine a command to add options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'

