# Obsidian config

These steps are recommended when creating a new Vault from scratch, otherwise be sure to copy the plugins and their respective configurations after creating the symbolic links.

- Before open the `Obsidian.app`, go to your vault, e.g.:

```shell
cd "~/knw/personal/"
```

- If you already have the `.obsidian` folder, delete it!

```shell
rm -rf .obsidian
```

- Create the `.obsidian` folder

```shell
mkdir .obsidian
cd .obsidian
```

- Create the symbolic link

```shell
ln -s ~/space/config-files/obsidian/.obsidian/icons/ .
ln -s ~/space/config-files/obsidian/.obsidian/plugins/ .
ln -s ~/space/config-files/obsidian/.obsidian/snippets/ .
ln -s ~/space/config-files/obsidian/.obsidian/themes/ .
ln -s ~/space/config-files/obsidian/.obsidian/app.json .
ln -s ~/space/config-files/obsidian/.obsidian/appearance.json .
ln -s ~/space/config-files/obsidian/.obsidian/backlink.json .
ln -s ~/space/config-files/obsidian/.obsidian/bookmarks.json .
ln -s ~/space/config-files/obsidian/.obsidian/community-plugins.json .
ln -s ~/space/config-files/obsidian/.obsidian/core-plugins-migration.json .
ln -s ~/space/config-files/obsidian/.obsidian/core-plugins.json .
ln -s ~/space/config-files/obsidian/.obsidian/graph.json .
ln -s ~/space/config-files/obsidian/.obsidian/hotkeys.json .
ln -s ~/space/config-files/obsidian/.obsidian/switcher.json .
ln -s ~/space/config-files/obsidian/.obsidian/templates.json .
ln -s ~/space/config-files/obsidian/.obsidian/types.json .
cp ~/space/config-files/obsidian/.obsidian/workspace.json .
cp ~/space/config-files/obsidian/.obsidian/workspaces.json .
cp ~/space/config-files/obsidian/.obsidian/daily-notes.json .
```

- Download `IcoMoon-Free` from https://github.com/Keyamoon/IcoMoon-Free or install it with brew

```shell
brew install --cask font-icomoon
```

- Open your Obsidian Vault with `Obsidian.app`
