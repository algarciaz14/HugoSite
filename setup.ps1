# Contenido de setup.ps1
# Instalar Hugo si no está instalado
if (!(Test-Path "$env:ProgramFiles\Hugo\hugo.exe")) {
    Invoke-WebRequest -Uri "https://github.com/gohugoio/hugo/releases/download/v0.81.0/hugo_extended_0.81.0_Windows-64bit.zip" -OutFile "hugo.zip"
    Expand-Archive -Path "hugo.zip" -DestinationPath "$env:ProgramFiles\Hugo"
    Remove-Item "hugo.zip"
}

# Instalar otras herramientas necesarias aquí si es necesario

# Instalar Shellcheck si no está instalado
if (!(Get-Command shellcheck -ErrorAction SilentlyContinue)) {
    choco install shellcheck -y
}


