$v = 1.0
echo "ConShell $v"
$games = cd
if (-not Test-Path $games/games) {
  echo "Welcome to CShell! Just setting up your space..."
  Add-Item "$games/games" -ItemType Directory
}
cd games
echo "GAMES:"
Get-ChildItem -Path "$games/cshell" -Filter *.psgame -r | % { $_.Name.Replace( ".ps1","") }
$name = Read-Host 'Enter the name of the game to create. You can edit it later in your local notepad.'
Add-Item "$name.ps1"
echo "# Welcome! ConShell is an open source game engine`n# for PowerShell.`n# Here is a simple game for you.`necho Hello World!`necho Use ConShell to develop`necho simple powershell games." >> "$name.ps1"
notepad $name.ps1
echo "Game Created. Exiting in 5 seconds."
Start-Sleep -s 5
exit
