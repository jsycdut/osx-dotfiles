# .bash_profile for OS X

# PS environment variable
 PS1="\[\e[1;31m\][\[\e[0m\e[1;36m\]\u\[\e[0m\e[1;32m\]@\[\e[0m\e[1;33m\]macbook\[\e[0m\] \[\e[1;35m\]\W\[\e[0m\e[1;31m]\e[0m\]\$\[\e[0m\] "

# use emacs style in shell
set -o emacs

# load aliases
for alias_file in $HOME/.config/aliases/*; do
    source $alias_file
done

# load environment variables
for env_file in $HOME/.config/envs/*; do
    source $env_file
done

export BASH_SILENCE_DEPRECATION_WARNING=1
