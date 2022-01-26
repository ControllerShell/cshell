$v = 1.0
echo "ConShell $v"
$games = cd
if (-not Test-Path $games/games) {
  echo "Could not find Games directory."
}
cd games
echo "GAMES:"
Get-ChildItem -Path "$games/cshell" -Filter *.psgame -r | % { $_.Name.Replace( ".ps1","") }
$name = Read-Host 'Enter the name of the game to create. You can edit it later in your local notepad.'
Add-Item "$name.ps1"
echo "# Welcome! ConShell is an open source game engine`n# for PowerShell.`n# Here is a simple game for you.`necho Hello World"  >>
notepad $name.ps1
