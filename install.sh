#!/bin/bash

echo "Desplegando entorno CLI con GNU Stow..."

# Moverse al directorio del script
cd "$(dirname "$0")"

# Aplicar los enlaces simbólicos hacia el $HOME
stow alacritty
stow starship
stow tmux
stow zsh
stow nvim

echo "¡Entorno enlazado con éxito!"
