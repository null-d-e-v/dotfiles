#!/bin/bash
set -e  

# Update the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install essential tools
echo "Installing essential tools..."
sudo apt install -y \
  git \
  curl \
  zsh \
  bat \
  trash-cli \
  exa \
  fzf \
  fd-find

echo "Setting zsh as default shell..."
chsh -s /bin/zsh

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Install Python Version Manager
if ! command -v pyenv &> /dev/null; then
  echo "Installing PYENV (Python Version Manager)..."
  curl -fsSL https://pyenv.run | bash
else 
  echo "PYENV is already installed."
fi

echo "Installing Python 3.10..."
pyenv install 3.10

# Install Node Version Manager
if ! command -v nvm &> /dev/null; then
  echo "Installing NVM (Node Version Manager)..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
  echo "NVM is already installed."
fi

# Install latest Node.js version
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

# Install Zellij
echo "Installing Zellij (terminal multiplexer)..."
wget https://github.com/zellij-org/zellij/releases/download/v0.42.2/zellij-x86_64-unknown-linux-musl.tar.gz -O z.tar.gz
tar -xvf z.tar.gz
chmod +x zellij
sudo mv zellij /usr/bin/zellij
rm z.tar.gz

echo "✅ Environment setup complete."
