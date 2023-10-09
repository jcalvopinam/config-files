# FZF configuration

## Make sure you have installed `fzf`
  ```shell
  fzf --version
  ```
  if not, install it using `brew`
  ```shell
  brew install fzf
  ```

## Add custom configuration for fzf commands
  ```shell
  cat ~/space/config-files/fzf/fzf-load-commands.zsh >> ~/.fzf.zsh
  ```

## Add new shorcuts for git
  ```shell
  cat ~/space/config-files/fzf/fzf-shorcuts.zsh >> /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  ```

## Shortcuts
* `ALT-W` - Git log
* `ALT-B` - List the git branches
* `ALT-S` - Git branch switch
* `ALT-D` - Git diff
