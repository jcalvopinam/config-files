# config-files

## Configuration files for most tools I use

* ads-block
* amethyst
* bat
* brew
* docker
* fzf
* git
* ghostty
* gpg
* hyper
* intellij-idea
* kitty
* mac
* maven
* nvim 
* omz
* raycast
* rectangle-pro
* sdkman
* slack
* sublime-text
* terminal
* vim
* windows-terminal


## Suggestion

* Clone the repo
```shell
  cd
  mkdir space
  cd space
  git clone https://github.com/jcalvopinam/config-files.git
```

* Install SDKMAN
```shell
curl -s "https://get.sdkman.io" | bash
```

* Create symbolic links that point to the files

```shell
ln -s ~/space/config-files/terminal/.aliases ~/
ln -s ~/space/config-files/terminal/.exports ~/
ln -s ~/space/config-files/terminal/.functions ~/
ln -s ~/space/config-files/terminal/.keybindings ~/
ln -s ~/space/config-files/terminal/.fzf.zsh ~/
ln -s ~/space/config-files/terminal/.fzf-commands ~/
ln -s ~/space/config-files/terminal/.fzf-ignore ~/
ln -s ~/space/config-files/terminal/.docker-commands ~/
ln -s ~/space/config-files/terminal/.zshrc ~/

ln -s ~/space/config-files/git/.gitignore_global ~/
ln -s ~/space/config-files/git/.gitconfig ~/

ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

mkdir ~/.config
ln -s ~/space/config-files/bat ~/.config/
ln -s ~/space/config-files/kitty ~/.config/
ln -s ~/space/config-files/raycast ~/.config/

mkdir -p ~/Library/Application\ Support/Sublime\ Text/Packages/User
ln -s ~/space/config-files/sublime-text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User
```
