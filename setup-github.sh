#!/bin/bash
# Setup GitHub remote for dotfiles

set -e

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Setup GitHub Remote${NC}\n"

# Check if remote already exists
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}⚠️  Remote 'origin' already exists${NC}"
    git remote -v
    echo ""
    read -p "Remove and add new remote? (y/n): " replace
    if [ "$replace" = "y" ]; then
        git remote remove origin
        echo -e "${GREEN}✓${NC} Removed old remote"
    else
        exit 0
    fi
fi

# Get GitHub username
read -p "Enter your GitHub username: " username
read -p "Enter repository name (default: dotfiles): " repo_name
repo_name=${repo_name:-dotfiles}

# Add remote with SSH
REPO_URL="git@github.com:$username/$repo_name.git"
git remote add origin "$REPO_URL"

echo ""
echo -e "${GREEN}✓${NC} Added remote: $REPO_URL"
echo ""
echo -e "${YELLOW}📝 Next steps:${NC}"
echo "  1. Create repository on GitHub: https://github.com/new"
echo "     Repository name: $repo_name"
echo "     Make it public or private"
echo ""
echo "  2. Push your dotfiles:"
echo "     cd ~/dotfiles"
echo "     git push -u origin main"
echo ""
echo -e "${BLUE}💡 Alternative (HTTPS):${NC}"
echo "  git remote set-url origin https://github.com/$username/$repo_name.git"
