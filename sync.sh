#!/bin/bash
# Dotfiles sync script

set -e

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"

echo "🔄 Syncing dotfiles..."

# Add all changes
git add -A

# Show status
echo ""
echo "📋 Changes:"
git status --short

# Commit with message
echo ""
read -p "💬 Commit message (or press Enter for auto): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Update dotfiles - $(date '+%Y-%m-%d %H:%M')"
fi

git commit -m "$commit_msg" || echo "⚠️  No changes to commit"

# Push to GitHub
echo ""
read -p "🚀 Push to GitHub? (y/n): " push
if [ "$push" = "y" ]; then
    git push origin main || git push origin master
    echo "✅ Pushed to GitHub!"
else
    echo "⏭️  Skipped push"
fi

echo ""
echo "✨ Done!"
