$v = 1.0
echo "ConShell $v"
echo "processing"
$games = cd
Get-ChildItem -Path $games"/cshell" -Filter *.psgame -r | % { $_.Name.Replace( ".psgame"," game") }
