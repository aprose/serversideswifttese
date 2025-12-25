#!/bin/bash

# Post-create script for GitHub Codespaces
echo "🚀 Setting up Vapor development environment..."

# Make sure we're in the right directory
cd /workspace

# Install Swift dependencies
echo "📦 Resolving Swift package dependencies..."
swift package resolve

# Create data directory for SQLite
echo "📁 Creating data directory..."
mkdir -p data

# Set proper permissions
echo "🔐 Setting permissions..."
chmod 755 data
chmod +x .devcontainer/post-create.sh

# Build the project to verify everything works
echo "🔨 Building project..."
swift build

echo "✅ Vapor development environment setup complete!"
echo ""
echo "🎯 Quick start commands:"
echo "  swift run           - Run the Vapor app"
echo "  swift test          - Run tests"
echo "  swift build         - Build the project"
echo ""
echo "🌐 Your app will be available on port 8080"
echo "📚 Visit /todos to see the todo list with dummy data"