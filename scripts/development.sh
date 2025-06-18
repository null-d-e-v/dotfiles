#!/bin/bash
set -e  

echo "Installing Python 3.10..."
pyenv install 3.10

# Install last version of nodejs
echo "Installing latest Node.js version..."
nvm install node

# Install Bun
if ! command -v bun &> /dev/null; then
  echo "Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
else
  echo "Bun is already installed."
fi

# Install pnpm
if ! command -v pnpm &> /dev/null; then
  echo "Installing pnpm..."
  curl -fsSL https://get.pnpm.io/install.sh | sh -
else
  echo "pnpm is already installed."
fi
