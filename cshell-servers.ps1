echo "ConShell Server Edition"
echo "Generating ID of game"
loop (30) {
  Write-Host "." -NoNewline
  $r = Get-Random -Minimum 3 -Maximum 10
  echo "$r" -NoNewline >> $global:Id
}
echo "Game ID: $global:Id"
echo "# Welcome to your new game.`n# Write some code below" >> "$global:Id.ps1"
