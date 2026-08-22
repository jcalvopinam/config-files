# Sync macOS System Appearance with nvim

## Installation
- Make a backup of your current Neovim files:

```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the starter
```sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

- Remove the .git folder, so you can add it to your own repo later
```sh
rm -rf ~/.config/nvim/.git
```

- Start Neovim!
```sh
nvim
```

## Theme
- Copy `cp $HOME/space/config-files/nvim/lazyvim/appearance.lua $HOME/.config/nvim/lua/plugins`


## Reference:
- https://www.lazyvim.org/installation
