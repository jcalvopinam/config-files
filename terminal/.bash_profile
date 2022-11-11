export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#GCP Credentials
export GOOGLE_APPLICATION_CREDENTIALS="/Users/jcalvopina/Downloads/siseg-ecuador-a8e0b760cb7f.json"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jcalvopina/.sdkman"
[[ -s "/Users/jcalvopina/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jcalvopina/.sdkman/bin/sdkman-init.sh"
