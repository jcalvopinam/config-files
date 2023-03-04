# OMZ Config

## OMZ installation
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\
```

## Themes' installation
```shell
ln -s ~/space/config-files/omz/themes/jc.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/space/config-files/omz/themes/juanca87.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/space/config-files/omz/themes/lambdazsh.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/space/config-files/omz/themes/robbyrussell2.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/space/config-files/omz/themes/robbyrussell3.zsh-theme ~/.oh-my-zsh/themes/
ln -s ~/space/config-files/omz/themes/ys-jc.zsh-theme ~/.oh-my-zsh/themes/
```

## Plugins' installation
### History
```shell
cat history.zsh >> ~/.oh-my-zsh/lib/history.zsh
```

### zsh-autosuggestions
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### zsh-completions
```shell
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

### zsh-syntax-highlighting
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
```
