#!/bin/bash

# deploy.sh - Script to deploy updates to GitHub Pages for the "Own Your Voice" Program

# Exit on any error
set -e

# Check if inside a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ Error: This script must be run from within a Git repository."
    echo "📂 Please navigate to your 'own-your-voice' project folder using 'cd own-your-voice' and try again."
    exit 1
fi

# Add all changes
echo "📥 Adding all changes..."
git add .

# Commit changes with a default message including the current date
COMMIT_MESSAGE="Update course content - $(date '+%Y-%m-%d %H:%M:%S')"
echo "✍️ Committing changes with message: $COMMIT_MESSAGE"
git commit -m "$COMMIT_MESSAGE" || {
    echo "⚠️ Nothing to commit. No changes detected."
    exit 0
}

# Push to the main branch
echo "🚀 Pushing changes to GitHub..."
git push origin main

echo "✅ Deployment complete! Your changes will be live at https://hipling.github.io/business_communication_course_1/ in a few minutes."
echo "🔍 Check the status in your GitHub repository under the 'Actions' tab if needed."