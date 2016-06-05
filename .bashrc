#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=rxvt-unicode-256color
export BROWSER=/usr/bin/google-chrome-stable

PATH=$PATH:~/.cabal/bin
setxkbmap -layout gb

PATH=$PATH:/usr/lib/jvm/java-8-jdk/bin
export JAVA_HOME=/usr/lib/jvm/java-8-jdk
export JRE_HOME=/usr/lib/jvm/java-8-jdk/jre

# My laptop system speaker beeps far too much when I'm using vim on the train :P
/usr/bin/xset b off

alias gus='git submodule update --init --recursive'
