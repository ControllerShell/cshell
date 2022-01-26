$v = 1.0
echo "ConShell $v"
echo "processing"
$games = cd

echo "GAMES:"
Get-ChildItem -Path "$games/cshell" -Filter *.psgame -r | % { $_.Name.Replace( ".psgame"," game") }
$name = Read-Host 'Enter the name of the game to create. You can edit it later in your local notepad.'
notepad $name.ps1
