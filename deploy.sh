#!/usr/bin/env bash

set -x

function copy_all_config_files_to_home
{
    cp .bash_profile $HOME
    cp -r .config $HOME
}

copy_all_config_files_to_home

