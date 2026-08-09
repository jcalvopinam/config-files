# Configuration for lsd

```shell
ln -s ~/space/config-files/lsd ~/.config/
```

## Themes

lsd uses `colors.yaml` as its color theme (`color.theme: custom` in `config.yaml`).
This repo ships two hand-tuned themes matching the Ghostty themes in
`../ghostty/themes/`:

- `dark.yaml` — matches `fancyDracula` (dark mode)
- `light.yaml` — matches `fancyLight` (light mode)

`colors.yaml` is a symlink pointing to the currently active theme. The
`themeToggle` function in `../terminal/.functions` re-points the symlink when
the macOS light/dark appearance changes:

```bash
ln -sfn dark.yaml  ~/.config/lsd/colors.yaml   # dark mode
ln -sfn light.yaml ~/.config/lsd/colors.yaml   # light mode
```
