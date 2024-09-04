#!/bin/bash
####
#### alias
alias gitl='git log --pretty="%h %ci W: %<(16,trunc)%an C: %<(16,trunc)%cn %s"'
####
#### Application Path
for file in "$DEV_HOME/etc/application.path"/*.path; do
    if [ -f "$file" ]; then
        echo "Sourcing $file"
        source "$file"
    fi
done
####
#### Tools Home Path
#
# FileZilla
export FILEZILLA_HOME=$DEV_HOME/opt/filezilla
#
# NodeJS
export NODEJS_HOME=$DEV_HOME/opt/nodejs
#
# Sublime
export SUBLIME_HOME=$DEV_HOME/opt/sublime
