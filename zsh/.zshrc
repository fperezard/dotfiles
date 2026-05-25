# Exportar idioma y capacidades de color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Inicializar Starship Prompt
eval "$(starship init zsh)"

# CONFIGURACIÓN DEL PAGINADOR INTERACTIVO (pspg)
# Esto asegura que los queries SQL tabulares se paginen de forma inteligente
export PAGER="pspg"
export PSQL_PAGER="pspg --style=4 --border=2"

# Historial optimizado
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory

# Atajos esenciales para data/dev
alias vim="nvim"
alias v="nvim"
alias t="tmux"
alias ta="tmux attach -t"
