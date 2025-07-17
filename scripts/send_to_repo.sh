#!/bin/bash

echo "🚀 Starting sendToRepo Finalized Push..."

# Set safe directory for Termux Git
git config --global --add safe.directory "/storage/emulated/0/Download/AiKre8tive-Stargate"

# Navigate to project directory
cd "/storage/emulated/0/Download/AiKre8tive-Stargate" || {
    echo "❌ Failed to enter project directory."
    exit 1
}

# Initialize Git if needed
if [ ! -d ".git" ]; then
    git init
    git branch -M main
    git remote add origin https://github.com/TheKre8tive/AiKre8tive-Stargate.git
fi

# Stage, commit, and push
git add .
git commit -m "🚀 Automated push by MrGTTP: Verdict Pipeline Finalized"
git push -u origin main

# Redeploy with Vercel
vercel --yes --prod

# Webhook Notification (Replace with your real endpoint!)
curl -X POST https://ai-kre8tive-stargate.vercel.app/api/webhook \
  -H "Content-Type: application/json" \
  -d '{"event":"verdict_push","status":"complete","agent":"MrGTTP"}'

echo "✅ Repo pushed, deployed, and webhook triggered."
