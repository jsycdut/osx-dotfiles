#!/usr/bin/env bash

# offer an option for installing sdkman, it may fail because sdkman
# needs unzip and other dependencies, install them if sdk complains.
# for more information about sdkman, visit https://sdkman.io/
[[ -n $1 && $1 == install ]] && curl -s "https://get.sdkman.io" | bash

# environment for sdkman to work
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
