#!/bin/bash
# SCRIPT DE SETUP PARA LINUX (NATIVO O WSL)
echo "Iniciando configuración del entorno Linux..."
sudo apt-get update
sudo apt-get install -y zsh tmux neovim stow git ripgrep fzf build-essential 
stow -d configs -t ~ zsh
stow -d configs -t ~ tmux
if [[ "$SHELL" != *"zsh"* ]]; then
    chsh -s $(which zsh)
    echo "Shell cambiada a Zsh. Por favor, reinicia la terminal."
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Instalar zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Configuración de Linux completada."
