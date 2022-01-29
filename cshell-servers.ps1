echo "ConShell Server Edition"
echo "Generating ID of game"
for ($i = 1; $i -le 30; $i++ ) {
  Write-Host "." -NoNewline
  $seed = Get-Random -Minimum 300
  $r = Get-Random -Minimum 3 -Maximum 10 -SetSeed $seed
  $r2 = Get-Random -Minimum 50 -Maximum 125
  $global:Id = "$global:Id$r"
  Start-Sleep -ms $r2
}
echo "Game ID: $global:Id"
echo "# Welcome to your new game.`n# Write some code below" >> "$global:Id.ps1"
