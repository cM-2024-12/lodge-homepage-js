#!/bin/bash

# ============================================
# GitHub Pages Deployment Script
# ============================================
# This script automates deploying your webpack
# build to GitHub Pages (gh-pages branch)
# ============================================

echo "🚀 Starting deployment process..."

# Step 1: Ensure we're on main branch
# ------------------------------------
# Switch to main branch where source code lives
git checkout main

# Step 2: Auto-commit any uncommitted changes
# --------------------------------------------
# Add all modified/new files to staging
git add .

# Commit changes (|| true prevents script from failing if nothing to commit)
git commit -m "Auto-commit before deploy: $(date)" || true

# Push commits to remote main branch
git push origin main

echo "✅ Main branch updated"

# Step 3: Switch to deployment branch
# ------------------------------------
# gh-pages branch is what GitHub Pages serves
git checkout gh-pages

# Step 4: Merge latest changes from main
# ---------------------------------------
# Bring all code changes from main into gh-pages
# --no-edit skips opening a text editor for merge message
git merge main --no-edit

echo "✅ Changes merged into gh-pages"

# Step 5: Build production bundle
# --------------------------------
# Run webpack to create optimized dist/ folder
npx webpack

echo "✅ Webpack build complete"

# Step 6: Commit the built files
# -------------------------------
# -f flag forces adding dist/ even though it's in .gitignore
git add dist -f

# Commit the bundled files with timestamp
git commit -m "Deployment commit: $(date)"

echo "✅ Build committed"

# Step 7: Deploy to GitHub Pages
# -------------------------------
# Push ONLY the dist/ folder contents to gh-pages branch
# --prefix dist tells git to push only that subdirectory
git subtree push --prefix dist origin gh-pages

echo "✅ Pushed to GitHub Pages"

# Step 8: Return to main branch
# ------------------------------
# Switch back to main for continued development
git checkout main

echo "🎉 Deployment complete! Check https://cm-2024-12.github.io/lodge-homepage-js/"