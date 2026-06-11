#!/bin/bash
# HeyClaude installer for bash/zsh

set -e

echo "Installing HeyClaude..."

# Check for dependencies
if ! command -v curl &> /dev/null; then
  echo "Error: curl is required but not installed"
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo "Error: jq is required but not installed"
  echo "Install with: sudo apt install jq (Ubuntu/Debian) or brew install jq (macOS)"
  exit 1
fi

# Create ~/bin if it doesn't exist
mkdir -p ~/bin

# Download and install script
cp heyclaude ~/bin/heyclaude
chmod +x ~/bin/heyclaude

# Add ~/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  echo "Added ~/bin to PATH in ~/.bashrc"
fi

# Check for API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo ""
  echo "⚠️  ANTHROPIC_API_KEY not set!"
  echo ""
  echo "To complete setup:"
  echo "1. Get your API key from https://console.anthropic.com/"
  echo "2. Add to your ~/.bashrc or ~/.zshrc:"
  echo '   export ANTHROPIC_API_KEY="sk-ant-..."'
  echo "3. Run: source ~/.bashrc"
else
  echo "✓ API key found"
fi

echo ""
echo "✓ HeyClaude installed to ~/bin/heyclaude"
echo ""
echo "Usage: heyclaude \"your question\""
echo ""
echo "Reload your shell or run: source ~/.bashrc"
