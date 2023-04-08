# Obsidian config

These steps are recommended when creating a new Vault from scratch, otherwise be sure to copy the plugins and their respective configurations after creating the symbolic links.

- Close the `Obsidian.app`
- Go to your  `Vault` folder, for example
```shell
cd "~/Documents/Obsidian Vault/Personal Vault/"
```

- Rename the `.obsidian` folder
```shell
mv .obsidian .obsidian_old
```

- Create the `.obsidian` folder and enter
```shell
mkdir .obsidian
cd .obsidian
```

- Create the symbolic link
```shell
ln -s ~/space/config-files/obsidian/.obsidian/* .
```

- Copy your personal workspace settings
```shell
cp ../.obsidian_old/workspace.json .
cp ../.obsidian_old/workspaces.json .
```

- Open the `Obsidian.app`
- Make sure everything is okey
- You can delete the `.obsidian_old` folder