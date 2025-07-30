# SCRIPT DE SETUP PARA WINDOWS (CON WSL)
# Ejecutar como Administrador

Write-Host " Iniciando configuración del host Windows..." -ForegroundColor Green
winget install Microsoft.Edit
winget install -e --id Git.Git

# --- Paso 1: Instalar WSL y Ubuntu ---
Write-Host " Instalando el Subsistema de Windows para Linux (Ubuntu)..."
wsl --install -d Ubuntu

# --- Paso 2: Instalar Alacritty ---
Write-Host " Instalando Alacritty..."
winget install -e --id Alacritty.Alacritty

# --- Paso 3: Instalar Mononoki Nerd Font ---
Write-Host " Instalando Mononoki Nerd Font..."
$fontZipUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Mononoki.zip"
$tempDir = "$env:TEMP\NerdFonts"
$fontZipFile = "$tempDir\Mononoki.zip"
$fontDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"

# Crear directorio temporal si no existe
if (-not (Test-Path -Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

# Descargar y descomprimir la fuente
Invoke-WebRequest -Uri $fontZipUrl -OutFile $fontZipFile
Expand-Archive -Path $fontZipFile -DestinationPath $tempDir -Force

# Instalar las fuentes (copiarlas al directorio de fuentes del usuario)
Get-ChildItem -Path $tempDir -Filter "*.ttf" -Recurse | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $fontDir
}

# Limpiar archivos temporales
Remove-Item -Path $tempDir -Recurse -Force

# --- Paso 4: Copiar la configuración de Alacritty ---
Write-Host " Configurando Alacritty..."
$alacrittyDir = "$env:APPDATA\alacritty"
if (-not (Test-Path -Path $alacrittyDir)) {
    New-Item -ItemType Directory -Path $alacrittyDir | Out-Null
}
Copy-Item -Path ".\configs\alacritty\alacritty.toml" -Destination "$alacrittyDir\alacritty.toml" -Force

# --- Paso 5: Ejecutar el script de setup de Linux DENTRO de WSL ---
Write-Host " handing over to the Linux setup script inside WSL..." -ForegroundColor Cyan
wsl --cd ~ -- bash -c "git clone https://github.com/fperezard/dotfiles.git && cd dotfiles && bash setup_linux.sh"

Write-Host " Configuración de Windows completada." -ForegroundColor Green