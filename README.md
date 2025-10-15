# 🏠 My Dotfiles

Personal configuration files managed with GNU Stow.

## 🖥️ Setup

**OS:** Arch Linux  
**WM:** Hyprland  
**Launcher:** Rofi  
**Theme:** Tokyo Night

## 📦 Packages

- **hypr** - Hyprland window manager configuration
- **rofi** - Application launcher with Tokyo Night theme

## 🚀 Installation

### Prerequisites

```bash
# Install stow
sudo pacman -S stow
```

### Clone and Deploy

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow individual packages
stow hypr
stow rofi

# Or stow everything at once
stow */
```

## 🔄 Usage

### Adding New Configs

```bash
# Create package directory
mkdir -p ~/dotfiles/PACKAGE/.config/PACKAGE

# Copy your config
cp ~/.config/PACKAGE/config ~/dotfiles/PACKAGE/.config/PACKAGE/

# Stow it
cd ~/dotfiles
stow PACKAGE
```

### Updating Configs

Just edit files in `~/dotfiles/` - they're symlinked to your actual config locations!

### Removing Symlinks

```bash
cd ~/dotfiles
stow -D PACKAGE  # Remove specific package
stow -D */       # Remove all
```

## 📸 Screenshots

Coming soon!

## 🎨 Theme

Using Tokyo Night color scheme across all applications:
- **Primary:** `#7aa2f7`
- **Background:** `#1a1b26`
- **Secondary:** `#24283b`

## 📝 License

MIT
