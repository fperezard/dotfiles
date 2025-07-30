#!/bin/bash
# SCRIPT DE SETUP PARA LINUX (NATIVO O WSL)
echo "Iniciando configuración del entorno Linux..."
sudo apt-get update
sudo apt-get install -y zsh tmux neovim stow git build-essential
stow -d configs -t ~ zsh
stow -d configs -t ~ tmux
if [[ "$SHELL" != *"zsh"* ]]; then
    chsh -s $(which zsh)
    echo "Shell cambiada a Zsh. Por favor, reinicia la terminal."
fi
echo "Configuración de Linux completada."