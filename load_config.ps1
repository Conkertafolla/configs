$baseConfigPath = $PSScriptRoot
$nushellConfigPath = "$baseConfigPath\nushell\config.nu"
$alacrittyConfigPath = "$baseConfigPath\alacritty\alacritty.toml"
$starshipConfigPath = "$baseConfigPath\starship.toml"
$lazyvimConfigPath = "$baseConfigPath\nvim"

# Destinos de los enlaces simbólicos
$nushellTargetPath = "$env:APPDATA\nushell\config.nu"
$alacrittyTargetPath = "$env:APPDATA\alacritty\alacritty.yml"
$starshipTargetPath = "$env:USERPROFILE\.config\starship.toml"

$lazyvimTargetPath = "$env:USERPROFILE\AppData\Local\nvim"

# Crear directorios necesarios
Write-Host "Creando directorios necesarios..."
New-Item -ItemType Directory -Force -Path "$env:APPDATA\nushell" | Out-Null
New-Item -ItemType Directory -Force -Path "$env:APPDATA\alacritty" | Out-Null
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config" | Out-Null
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\AppData\Local\nvim" | Out-Null

# Crear enlaces simbólicos
Write-Host "Creando enlaces simbólicos..."

if (Test-Path $nushellTargetPath) {
    Remove-Item $nushellTargetPath -Force
}
cmd /c mklink $nushellTargetPath $nushellConfigPath

if (Test-Path $alacrittyTargetPath) {
    Remove-Item $alacrittyTargetPath -Force
}
cmd /c mklink $alacrittyTargetPath $alacrittyConfigPath

if (Test-Path $starshipTargetPath) {
    Remove-Item $starshipTargetPath -Force
}
cmd /c mklink $starshipTargetPath $starshipConfigPath

if (Test-Path $lazyvimTargetPath) {
   Remove-Item $lazyvimTargetPath -Recurse -Force
}
cmd /c mklink /D $lazyvimTargetPath $lazyvimConfigPath

Write-Host "Enlaces simbólicos creados exitosamente."
