# Git shortcuts

## Make sure you have installed `fzf`
  ```sh
  fzf --version
  ```
  if not, install it using `brew`
  ```sh
  brew install fzf
  ```

## Add custom configuration for fzf commands
  ```sh
  cat fzf-load-commands.zsh >> ~/.fzf.zsh
  ```

## Add new shorcuts for git
  ```sh
  cat fzf-shorcuts.zsh >> /usr/local/opt/fzf/shell/key-bindings.zsh
  ```

## Shortcuts
* CTRL-W - Git log
* CTRL-B - List the git branches
* CTRL-S - Git branch switch
* CTRL-P - Git pull
