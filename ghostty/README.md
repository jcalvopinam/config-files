# Configuration for ghostty

- Create themes folder
```shell
mkdir $HOME/.config/ghostty
ln -s $HOME/space/config-files/ghostty/themes $HOME/.config/ghostty/
```

- Delete the default config
```shell
rm -rf $HOME/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty
```

- Create symbolic link to the config
```shell
ln -s $HOME/space/config-files/ghostty/config.ghostty $HOME/Library/Application\ Support/com.mitchellh.ghostty/
```
