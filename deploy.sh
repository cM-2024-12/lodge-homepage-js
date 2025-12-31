#!/bin/bash

# ============================================
# GitHub Pages Deployment Script
# ============================================

echo "🚀 Starting deployment process..."

# Step 1: Ensure we're on main branch
git checkout main

# Step 2: Auto-commit any uncommitted changes
git add .
git commit -m "Auto-commit before deploy: $(date)" || true
git push origin main

echo "✅ Main branch updated"

# Step 3: Switch to deployment branch
git checkout gh-pages

# Step 4: Merge latest changes from main
# Add --allow-unrelated-histories if needed
git merge main --no-edit --allow-unrelated-histories

# Check if merge succeeded
if [ $? -ne 0 ]; then
    echo "❌ Merge failed! Aborting..."
    git merge --abort
    git checkout main
    exit 1
fi

echo "✅ Changes merged into gh-pages"

# Step 5: Build production bundle
npx webpack

# Check if webpack succeeded
if [ ! -d "dist" ]; then
    echo "❌ Webpack build failed - dist folder not created!"
    git checkout main
    exit 1
fi

echo "✅ Webpack build complete"

# Step 6: Commit the built files
git add dist -f
git commit -m "Deployment commit: $(date)"

echo "✅ Build committed"

# Step 7: Deploy to GitHub Pages
git subtree push --prefix dist origin gh-pages

echo "✅ Pushed to GitHub Pages"

# Step 8: Return to main branch
git checkout main

echo "🎉 Deployment complete! Check https://cm-2024-12.github.io/lodge-homepage-js/"