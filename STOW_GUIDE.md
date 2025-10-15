# 📚 GNU Stow Quick Reference

## How Stow Works

Stow creates symlinks from `~/dotfiles/PACKAGE/.config/` → `~/.config/`

**Structure:**
```
~/dotfiles/
├── hypr/.config/hypr/         # Package "hypr"
│   └── hyprland.conf
├── rofi/.config/rofi/         # Package "rofi"
│   ├── config.rasi
│   └── tokyo-night.rasi
└── ...
```

## Common Commands

### Stow (Create symlinks)
```bash
cd ~/dotfiles
stow hypr          # Stow single package
stow rofi          # Stow single package
stow */            # Stow ALL packages
```

### Unstow (Remove symlinks)
```bash
cd ~/dotfiles
stow -D hypr       # Unstow single package
stow -D */         # Unstow ALL packages
```

### Restow (Re-create symlinks)
```bash
cd ~/dotfiles
stow -R hypr       # Restow single package
stow -R */         # Restow ALL packages
```

### Dry Run (Test without changes)
```bash
stow -n hypr       # See what would happen
stow -nv hypr      # Verbose dry run
```

## Adding New Configs

### Method 1: Manual
```bash
# Create package structure
mkdir -p ~/dotfiles/PACKAGE/.config/PACKAGE

# Copy your config
cp ~/.config/PACKAGE/config ~/dotfiles/PACKAGE/.config/PACKAGE/

# Remove original
rm -rf ~/.config/PACKAGE

# Stow it
cd ~/dotfiles && stow PACKAGE
```

### Method 2: Using sync script
```bash
# Just edit files in ~/dotfiles/
# They're already symlinked!

# Then sync to GitHub
~/dotfiles/sync.sh
```

## Backup to GitHub

### Quick sync
```bash
cd ~/dotfiles
./sync.sh
```

### Manual push
```bash
cd ~/dotfiles
git add -A
git commit -m "Update configs"
git push
```

## Troubleshooting

### Conflict exists
```bash
# If stow says file exists:
# 1. Backup the existing file
mv ~/.config/PACKAGE ~/.config/PACKAGE.backup

# 2. Stow again
stow PACKAGE
```

### See what's stowed
```bash
ls -la ~/.config/ | grep "\->"
```

### Verify symlinks
```bash
# Should show symlinks to ~/dotfiles/
ls -la ~/.config/hypr
ls -la ~/.config/rofi
```

## Tips

- Always run stow from `~/dotfiles/` directory
- Package names match directory names in `~/dotfiles/`
- Stow mirrors the directory structure
- Editing `~/dotfiles/` files = editing actual configs (they're symlinked!)
