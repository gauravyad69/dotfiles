# 🏠 My Dotfiles

Personal configuration files managed with GNU Stow.

## 🖥️ Setup

**OS:** Arch Linux  
**WM:** Hyprland  
**Launcher:** Rofi  
**Theme:** Tokyo Night  
**Dotfiles Manager:** GNU Stow

## 📦 Packages

- **hypr** - Hyprland window manager configuration
- **rofi** - Application launcher with Tokyo Night theme

## 🚀 Quick Start

### Install on New Machine

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install stow
sudo pacman -S stow

# Stow everything
stow */
```

### First Time Setup (This Machine)

```bash
# Setup GitHub remote
~/dotfiles/setup-github.sh

# Push to GitHub
cd ~/dotfiles
git push -u origin main
```

## �� Daily Usage

### Add New Config

```bash
# Easy way - just provide the path
~/dotfiles/add-config.sh ~/.config/kitty

# Or run interactively
~/dotfiles/add-config.sh
```

### Edit Configs

Just edit files in `~/dotfiles/` - they're automatically synced via symlinks!

```bash
nano ~/dotfiles/hypr/.config/hypr/hyprland.conf
nano ~/dotfiles/rofi/.config/rofi/config.rasi
```

### Backup to GitHub

```bash
~/dotfiles/sync.sh
```

## 🛠️ Scripts

| Script | Purpose |
|--------|---------|
| `add-config.sh` | Add new configs to dotfiles |
| `setup-github.sh` | Setup GitHub remote |
| `sync.sh` | Backup dotfiles to GitHub |

## 🔄 Stow Commands

```bash
cd ~/dotfiles

# Stow a package
stow hypr

# Stow all packages
stow */

# Remove symlinks
stow -D hypr

# Re-stow (refresh)
stow -R hypr
```

## 📂 Directory Structure

```
~/dotfiles/
├── hypr/.config/hypr/           # Hyprland
├── rofi/.config/rofi/           # Rofi
├── add-config.sh                # Add configs script
├── setup-github.sh              # GitHub setup
├── sync.sh                      # Backup script
├── STOW_GUIDE.md               # Stow reference
└── README.md                    # This file
```

## 🎨 Theme

Tokyo Night color scheme:
- **Primary:** `#7aa2f7`
- **Background:** `#1a1b26`
- **Secondary:** `#24283b`
- **Accent:** `#bb9af7`

## 📸 Screenshots

Coming soon!

## 📝 License

MIT
