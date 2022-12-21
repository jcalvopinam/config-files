#config-files

## Configuration files for most tools I use

* ads-block
* bat
* git
* hyper
* kitty
* maven
* omz
* sublime-text
* windows-terminal
* amethyst
* brew
* gpg
* intellij-idea
* mac
* nvim 
* rectangle-pro
* slack
* terminal


## Suggestion

* Clone the repo
```shell
  cd
  mkdir space
  cd space
  git clone https://github.com/jcalvopinam/config-files.git
```

* Create symbolic links that point to the files

```shell
ln -s ~/space/config-files/terminal/.alias ~/
ln -s ~/space/config-files/terminal/.exports ~/
ln -s ~/space/config-files/terminal/.functions ~/
ln -s ~/space/config-files/terminal/.zshrc ~/
ln -s ~/space/config-files/git/.gitignore_global ~/

ln -s ~/space/config-files/bat ~/.config/
ln -s ~/space/config-files/kitty ~/.config/

mkdir -p ~/.config/nvim
ln -s ~/space/config-files/nvim/init.vim ~/.config/nvim/
ln -s ~/space/config-files/nvim/colors ~/.config/nvim/

ln -s ~/space/config-files/sublime-text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```