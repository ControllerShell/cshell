echo "ConShell Server Edition"
echo "Generating ID of game"
l {
  Write-Host "." -NoNewline
  $r = Get-Random -Minimum 3 -Maximum 10
  $r2 = Get-Random -Minimum 50 -Maximum 125
  echo "$r" -NoNewline >> $global:Id
  Start-Sleep -ms $r2
}
echo "Game ID: $global:Id"
echo "# Welcome to your new game.`n# Write some code below" >> "$global:Id.ps1"
