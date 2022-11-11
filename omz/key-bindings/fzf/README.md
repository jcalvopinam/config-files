# Git shortcuts

## Make sure you have installed `fzf`
  ```sh
  fzf --version
  ```
  if not, install it using `brew`
  ```sh
  brew install fzf
  ```

## Add new shorcuts for git
  ```sh
  cat omz/key-bindings/fzf/git-keys.zsh >> /usr/local/opt/fzf/shell/key-bindings.zsh
  ```

## Shortcuts
* CTRL-W - Git log
* CTRL-B - List the git branches
* CTRL-S - Git branch switch
* CTRL-P - Git pull
