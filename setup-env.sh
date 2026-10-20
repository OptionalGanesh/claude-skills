#!/bin/bash
set -e

echo "Setting up the environment for Jules..."

echo "Updating package list..."
sudo apt update

echo "Installing system dependencies..."
sudo apt install -y ffmpeg libsndfile1 portaudio19-dev graphviz

echo "Installing Node.js package managers..."
npm install -g pnpm yarn

echo "Environment setup complete!"
