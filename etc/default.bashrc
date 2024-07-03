#!/bin/bash
####
#### alias
alias gitl='git log --pretty="%h %H %ai %<(16,trunc)%an %ci %<(16,trunc)%cn %s"'
####
#### Application Path
[ -f $DEV_HOME/etc/application.path/ant.path ] && source $DEV_HOME/etc/application.path/ant.path
[ -f $DEV_HOME/etc/application.path/maven.path ] && source $DEV_HOME/etc/application.path/maven.path
####
#### Tools Home Path
#
# FileZilla
export FILEZILLA_HOME=$DEV_HOME/opt/filezilla
#
# NodeJS
export NODEJS_HOME=$DEV_HOME/opt/nodejs
#
# Visual Studio Code
export VSCODE_HOME=$DEV_HOME/opt/vscode
#
# Sublime
export SUBLIME_HOME=$DEV_HOME/opt/sublime
