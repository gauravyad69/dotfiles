#!/bin/bash
# Add new config to dotfiles with GNU Stow

set -e

DOTFILES_DIR="$HOME/dotfiles"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}📦 Add Config to Dotfiles${NC}\n"

# Get config path from argument or prompt
if [ -n "$1" ]; then
    CONFIG_PATH="$1"
else
    read -p "Enter full config path (e.g., ~/.config/kitty): " CONFIG_PATH
fi

# Expand ~ to full path
CONFIG_PATH="${CONFIG_PATH/#\~/$HOME}"

# Validate path exists
if [ ! -e "$CONFIG_PATH" ]; then
    echo -e "${RED}❌ Error: Path does not exist: $CONFIG_PATH${NC}"
    exit 1
fi

# Extract package name and relative path
if [[ "$CONFIG_PATH" == "$HOME/.config/"* ]]; then
    # It's in .config
    PACKAGE_NAME=$(basename "$CONFIG_PATH")
    RELATIVE_PATH=".config/$PACKAGE_NAME"
elif [[ "$CONFIG_PATH" == "$HOME/."* ]]; then
    # It's a dotfile in home
    PACKAGE_NAME=$(basename "$CONFIG_PATH" | sed 's/^\.//')
    RELATIVE_PATH=$(basename "$CONFIG_PATH")
else
    echo -e "${RED}❌ Error: Only ~/.config/* and ~/.* paths are supported${NC}"
    exit 1
fi

echo -e "${BLUE}Package name:${NC} $PACKAGE_NAME"
echo -e "${BLUE}Path:${NC} $CONFIG_PATH"
echo ""

# Create package directory structure
PACKAGE_DIR="$DOTFILES_DIR/$PACKAGE_NAME"
TARGET_DIR="$PACKAGE_DIR/$(dirname "$RELATIVE_PATH")"

mkdir -p "$TARGET_DIR"
echo -e "${GREEN}✓${NC} Created $TARGET_DIR"

# Copy config to dotfiles
if [ -d "$CONFIG_PATH" ]; then
    # It's a directory
    cp -r "$CONFIG_PATH" "$TARGET_DIR/"
    echo -e "${GREEN}✓${NC} Copied directory to dotfiles"
    
    # Backup and remove original
    BACKUP_PATH="${CONFIG_PATH}.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$CONFIG_PATH" "$BACKUP_PATH"
    echo -e "${GREEN}✓${NC} Backed up to $BACKUP_PATH"
else
    # It's a file
    cp "$CONFIG_PATH" "$TARGET_DIR/"
    echo -e "${GREEN}✓${NC} Copied file to dotfiles"
    
    # Backup and remove original
    BACKUP_PATH="${CONFIG_PATH}.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$CONFIG_PATH" "$BACKUP_PATH"
    echo -e "${GREEN}✓${NC} Backed up to $BACKUP_PATH"
fi

# Stow the package
cd "$DOTFILES_DIR"
stow -v "$PACKAGE_NAME"
echo -e "${GREEN}✓${NC} Stowed $PACKAGE_NAME"

echo ""
echo -e "${GREEN}✨ Done! ${NC}Config added to dotfiles and symlinked"
echo -e "${YELLOW}💡 Tip:${NC} Edit configs in ~/dotfiles/$PACKAGE_NAME/"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  cd ~/dotfiles"
echo "  git add $PACKAGE_NAME"
echo "  git commit -m \"Add $PACKAGE_NAME config\""
