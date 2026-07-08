#!/usr/bin/env bash

set -euo pipefail

# -----------------------------------------------------------------------------
# Bootstrap
# -----------------------------------------------------------------------------

install_sdkman() {
  echo ":: Installing sdkman..."
  /bin/bash -c "$(curl -fsSL https://get.sdkman.io)"
  /bin/bash -c "sdk install java 21.0.11-amzn"
}

load_brew() {
  if command -v brew >/dev/null 2>&1; then
    return
  fi

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

install_homebrew() {
  echo "🍺 Installing Homebrew..."

  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  load_brew
}

install_gum() {
  echo
  echo "📦 Instalando gum..."
  echo

  if command -v gum >/dev/null 2>&1; then
    return
  fi

  ARCH=$(uname -m)

  case "$ARCH" in
    arm64)
      GUM_ARCH="arm64"
      ;;
    x86_64)
      GUM_ARCH="x86_64"
      ;;
    *)
      echo "Arquitectura no soportada: $ARCH"
      exit 1
      ;;
  esac

  VERSION="0.14.5"

  TMP_DIR=$(mktemp -d)

  curl -L \
    "https://github.com/charmbracelet/gum/releases/download/v${VERSION}/gum_${VERSION}_Darwin_${GUM_ARCH}.tar.gz" \
    -o "$TMP_DIR/gum.tar.gz"

  tar -xzf "$TMP_DIR/gum.tar.gz" -C "$TMP_DIR"

  GUM_BIN=$(find "$TMP_DIR" -type f -name "gum" -perm +111 | head -n 1)

  if [[ -z "$GUM_BIN" ]]; then
      echo "✗ No se encontró el binario gum"
      exit 1
  fi

  echo ":: Installing gum from: $GUM_BIN"

  sudo mv "$GUM_BIN" /usr/local/bin/gum
  sudo chmod +x /usr/local/bin/gum

  rm -rf "$TMP_DIR"

  echo ":: ✓ gum installed"
}

# -----------------------------------------------------------------------------
# Installers
# -----------------------------------------------------------------------------

install_brew_package() {
  local package=$1
  local is_cask=${2:-"formula"} # Por defecto, se asume que es una fórmula

  echo ":: Checking if $package is already installed..."

  if [[ "$is_cask" == "cask" ]]; then
    if brew list --cask "$package" &>/dev/null; then
      gum log --level info ":: ✓ $package already installed"
      return
    fi
  else
    if brew list "$package" &>/dev/null; then
      gum log --level info ":: ✓ $package already installed"
      return
    fi
  fi

  echo ":: Installing $package..."
  if [[ "$is_cask" == "cask" ]]; then
    brew install -y "$package" --cask
  else
    brew install -y "$package"
  fi

  if [[ $? -eq 0 ]]; then
    gum log --level info ":: The $package launcher ran successfully."
  else
    gum log --level error ":: Failed to install $package. Please check the logs."
    exit 1
  fi
}

install_fzf() {
  if ! command -v fzf >/dev/null 2>&1; then
    install_brew_package fzf

    ln -sf $HOME/space/config-files/terminal/.fzf.zsh $HOME/
    ln -sf $HOME/space/config-files/terminal/.fzf-commands $HOME/
    ln -sf $HOME/space/config-files/terminal/.fzf-ignore $HOME/

    gum log --level info ":: The fzf launcher ran..."
  fi
}

install_code() {
  install_brew_package "visual-studio-code" "cask"
}

install_amethyst() {
  install_brew_package "amethyst" "cask"
  cp $HOME/space/config-files/amethyst/com.amethyst.Amethyst.plist $HOME/Library/Preferences/
}

install_ghostty() {
  install_brew_package "ghostty" "cask"
  rm -rf $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
  ln -sf $HOME/space/config-files/ghostty/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/
}

install_kitty() {
  install_brew_package "kitty" "cask"
  ln -sf $HOME/space/config-files/kitty $HOME/.config/
}

install_iterm2() {
  install_brew_package "iterm2" "cask"

  gum style \
        --border rounded \
        --padding "1 2" \
        "To configure iTerm, import the following settings:
  - Go to 'Menu > General > Settings'
  - Choose 'Import All Settings and Data...'
  - Go to 'Menu > Profiles > Other Actions...'
    - Choose 'Import JSON Profiles...'
    - Choose 'Colors > Color presets > Import...'
  - Go to 'Menu > Keys > Key Bindings > Presets ...'
  - Choose 'Import'"
}

install_raycast() {
  install_brew_package "raycast" "cask"

  gum style \
        --border rounded \
        --padding "1 2" \
        "To configure raycast, import the following settings:
  - Go to 'Raycast > Settings'
  - Choose 'Advanced' tab
  - Scroll down to 'Import / Export'
  - Choose 'Import'"
}

install_subl() {
  install_brew_package "sublime-text" "cask"
  mkdir -p $HOME/Library/Application\ Support/Sublime\ Text/Packages/User
  ln -sf $HOME/space/config-files/sublime-text/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text/Packages/User
  
  gum style \
    --padding "1 2" \
    "To install Package Controller:
  - Open 'Sublime Text' press Crtl+\`
  - In the console paste and run the following script:
from urllib.request import urlretrieve; urlretrieve(url="https://download.sublimetext.com/Package%20Control.sublime-package", filename=sublime.installed_packages_path() + '/Package Control.sublime-package')
  - Press cmd + shift + p and type 'Package Control: Install Package'"
}

install_obsidian() {
  install_brew_package "obsidian" "cask"
}

install_bat() {
  install_brew_package "bat"
  ln -sf $HOME/space/config-files/bat $HOME/.config/
}

install_fnm() {
  install_brew_package "fnm"
}

install_lsd() {
  install_brew_package "lsd"
}

install_nvim() {
  install_brew_package "neovim"

  mkdir -p "$HOME/.config"
  [ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim.bak" && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
  git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  rm -rf $HOME/.config/nvim/.git
}

install_lazygit() {
  install_brew_package "lazygit"
}

install_mole() {
  install_brew_package "mole"
}

install_pyenv() {
  install_brew_package "pyenv"
}

install_gnutls() {
  install_brew_package "ripgrep"
  install_brew_package "watch"
  install_brew_package "jq"
  install_brew_package "sevenzip"
  install_brew_package "gnutls"
}

install_omz() {
  echo ":: Installing omz..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  git clone --depth 1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions

  git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting

  ln -sf $HOME/space/config-files/omz/themes/jc.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -sf $HOME/space/config-files/omz/themes/juanca87.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -sf $HOME/space/config-files/omz/themes/lambdazsh.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -sf $HOME/space/config-files/omz/themes/robbyrussell2.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -sf $HOME/space/config-files/omz/themes/robbyrussell3.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -sf $HOME/space/config-files/omz/themes/ys-jc.zsh-theme $HOME/.oh-my-zsh/themes/

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

  brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true

  ln -sf $HOME/space/config-files/p10k/.p10k.zsh $HOME/
}

install_symbolic_links() {
  mv $HOME/.zshrc{,.bak} 2>/dev/null || true
  ln -sf $HOME/space/config-files/terminal/.aliases $HOME/
  ln -sf $HOME/space/config-files/terminal/.exports $HOME/
  ln -sf $HOME/space/config-files/terminal/.functions $HOME/
  ln -sf $HOME/space/config-files/terminal/.keybindings $HOME/
  ln -sf $HOME/space/config-files/terminal/.zshrc $HOME/
}

check_prerequisites() {
  echo "🔍 Checking requirements..."

  export SDKMAN_DIR="$HOME/.sdkman"

  if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
      set +eu
      source "$SDKMAN_DIR/bin/sdkman-init.sh"
      set -eu
  fi

  if ! command -v sdk >/dev/null 2>&1; then
    echo "........///......."
    install_sdkman
  else
    echo "✓ sdkman"
    if ! command -v java >/dev/null 2>&1; then
      echo "✗ Java is not installed. Please install Java manually."
      exit 1
    else
      echo "✓ Java"
    fi
  fi

  if ! command -v brew >/dev/null 2>&1; then
    install_homebrew
  else
    echo "✓ Homebrew"
  fi

  if ! command -v gum >/dev/null 2>&1; then
    install_gum
  else
    echo "✓ Gum"
  fi
}

run_installer() {
  local package=$1
  local function_name="install_${package//-/_}"

  if declare -f "$function_name" >/dev/null; then
    export -f "$function_name"
    gum style --foreground 212 ":: Checking ${package}..."
    "$function_name"

    gum style --foreground 10 ":: ✓ ${package} installed"

    #gum spin \
    #  --spinner dot \
    #  --title "Installing ${package}..." \
    #  -- \
    #  bash -c "$function_name"
  else
    gum log --level warn ":: Installer not found: ${package}"
  fi
}


# -----------------------------------------------------------------------------
# Packages
# -----------------------------------------------------------------------------

MANDATORY=(
  "sdk"
  "fzf"
  "bat"
)

OPTIONAL=(
  "omz"
  "code"
  "amethyst"
  "ghostty"
  "kitty"
  "iterm2"
  "fnm"
  "lsd"
  "nvim"
  "lazygit"
  "mole"
  "pyenv"
  "obsidian"
  "raycast"
  "subl"
  "gnutls"
  "subl"
)

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

check_prerequisites

clear

gum style \
    --foreground 212 \
    --bold \
    "🚀 Dotfiles Installer"

echo

# Filtrar los paquetes obligatorios que no están instalados
MANDATORY_TO_INSTALL=()
for item in "${MANDATORY[@]}"; do
    if ! command -v "$item" >/dev/null 2>&1; then
        MANDATORY_TO_INSTALL+=("$item")
    fi
done

if [[ ${#MANDATORY_TO_INSTALL[@]} -gt 0 ]]; then
    gum style \
        --border rounded \
        --padding "1 2" \
        "To configure the dot files in this repository, you must install the following packages by default:"

    echo

    for item in "${MANDATORY_TO_INSTALL[@]}"; do
        echo "  • $item"
    done 

    echo

    read -r -p "Do you want to continue? [y/N] " answer

    case "$answer" in
        y|Y|s|S)
            echo
            gum style --foreground 10 "Installing required packages..."

            for item in "${MANDATORY_TO_INSTALL[@]}"; do
                run_installer "$item"
            done
            ;;
        *)
            echo "Installation cancelled."
            exit 0
            ;;
    esac
else
    gum style --foreground 10 "All mandatory packages are already installed."
fi

echo

if gum confirm "Do you want to install optional packages?"; then
  # Filtrar los paquetes opcionales que no están instalados
# Filtrar los paquetes opcionales que no están instalados
OPTIONAL_TO_INSTALL=()
for item in "${OPTIONAL[@]}"; do
    if [[ "$item" == "omz" ]]; then
        # Verificar si oh-my-zsh está instalado
        if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
            OPTIONAL_TO_INSTALL+=("$item")
        fi
    else
        # Verificar si el comando está disponible
        if ! command -v "$item" >/dev/null 2>&1; then
            OPTIONAL_TO_INSTALL+=("$item")
        fi
    fi
done

if [[ ${#OPTIONAL_TO_INSTALL[@]} -gt 0 ]]; then
    gum style \
        --border rounded \
        --padding "1 2" \
        "The following optional packages are available for installation:"

    echo

    OPTIONAL_SELECTED=$(
        gum choose \
            --no-limit \
            --header "SPACE: select | ENTER: continue" \
            "${OPTIONAL_TO_INSTALL[@]}"
    )

    if [[ -n "$OPTIONAL_SELECTED" ]]; then
        echo
        gum style --foreground 10 "Installing selected optional packages..."

        while IFS= read -r item; do
            run_installer "$item"
        done <<< "$OPTIONAL_SELECTED"
    fi
  fi
else
  gum style --foreground 10 "All optional packages are already installed."
fi

echo

install_symbolic_links

gum style \
    --foreground 10 \
    --bold \
    "✔ Dotfiles setup completed"