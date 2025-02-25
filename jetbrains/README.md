# Jetbrains

## IntelliJ

### Import Keymap

- Copy the `macOS_idea_keymap.xml` into the Intellij folder, make sure to replace `<x.y.z>` with your current version

```shell
cp $HOME/space/config-files/jetbrains/idea/macOS_idea_keymap.xml $HOME/Library/Application\ Support/JetBrains/IntelliJIdea<x.y.z>/keymaps/
```

### Import codestyle

- Go to `Settings` ( `cmd` + `,`)
- Click on `Editor` > `Code Style` and on the gear icon
- Select `Import Schema`
- Choose `IntelliJ IDEA code style XML`
- Select the file and click open

## Import Keymap to Data Grip

- Copy the `macOS_datagrip_keymap.xml` into the DataGrip folder, make sure to replace `<x.y.z>` with your current version

```shell
cp $HOME/space/config-files/jetbrains/idea/macOS_datagrip_keymap.xml $HOME/Library/Application\ Support/JetBrains/DataGrip<x.y.z>/keymaps/
```

## Center the editor code

- Press `shift` + `shift`
- Type `registry...`
- Type `editor.distraction.free.mode`
- Check the value `ON`
- Close
