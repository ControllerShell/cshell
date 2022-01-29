# Warning: Contains global variables to function.
  
# Sets the version and produces the splash screen.
$v = 1.0
$host.ui.RawUI.WindowTitle = “ConShell $v Standalone”
cls
echo "╔═══╗─────╔═══╦╗────╔╗╔╗"
echo "║╔═╗║─────║╔═╗║║────║║║║"
echo "║║─╚╬══╦═╗║╚══╣╚═╦══╣║║║"
echo "║║─╔╣╔╗║╔╗╬══╗║╔╗║║═╣║║║"
echo "║╚═╝║╚╝║║║║╚═╝║║║║║═╣╚╣╚╗"
echo "╚═══╩══╩╝╚╩═══╩╝╚╩══╩═╩═╝"
echo "        VERSION $v - FREE AND OPEN SOURCE"
Start-Sleep -s 3
$height = 10
for ($i = 1; $i -le $height; $i++ )
{
    Write-Host - -NoNewline
    Start-Sleep -ms 50
}
Write-Host
# Stop if user is on Windows PowerShell. For the FOSS version of PowerShell, it should return "core". Try "echo $PSVersionTable.PSEdition".
if ($PSVersionTable.PSEdition -ne "Core") {
  Write-Host "Sorry, ControllerShell is currently only supported for PowerShell Core. Stay tuned for Windows PowerShell support. ;)"
  pause
  exit
}
# Add a license agreement warning. This renders the BSD 2-clause license used by CShell.


$host.ui.RawUI.WindowTitle = “License - ConShell $v Standalone”
echo "BSD 2-Clause License"
echo ""
echo "Copyright 2022 ControllerShell"

echo "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:"
echo "   1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer."
echo "   2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution."

echo "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

Write-Host "Press Enter to accept this license."
pause
for ($i = 1; $i -le $height; $i++ )
{
    Write-Host - -NoNewline
    Start-Sleep -ms 50
}
Write-Host
$host.ui.RawUI.WindowTitle = “Dashboard - ConShell $v Standalone”
echo "ConShell $v"
$global:games = Get-Location
$test = Test-Path -Path $global:games"/games"
# Asks the user to set up the workspace.
if (-not $test) {
      echo "Welcome to CShell! The app çould not locate a workspace. Please create one in $global:games by creating the ``games`` subbfolder."
      
}
while (!(Test-Path "$global:games/games")) { Start-Sleep -ms 1 }
cd games


# List all games in the workspace.
echo "GAMES:"
echo "Directory $global:games"
for ($i = 1; $i -le 20; $i++ )
{
    Write-Host - -NoNewline
    Start-Sleep -ms 25
}
echo ""
Get-ChildItem -Path "$global:games/games" -Filter *.ps1 -r | % { $_.Name.Replace( ".ps1"," (Ps1)") }
Get-ChildItem -Path "$global:games/games" -Filter *.psm1 -r | % { $_.Name.Replace( ".ps1"," (PsM1)") }
Get-ChildItem -Path "$global:games/games" -Filter *.psd1 -r | % { $_.Name.Replace( ".ps1"," (PsD1)") }
# Adds an input requesting a user to add a new game to the workspace.
$global:name = Read-Host 'Enter the name of the game to create or load'

$exists = Test-Path -Path $global:games"/"$global:name".ps1"
if (-not $exists) {
  if($global:name -like '*ConShell*' -or $global:name -like '*ControllerShell*' -or $global:name -like '*CShell*') {
      Write-Host 'Naming Error. The names of ControllerShell must not be used in the name of games.`nPlease only name games with no official names of ConShell since the names of the program are fully copyrighted.'
      pause
      cls
      Start-Sleep -ms 100
      exit
  }
  # Add a beginner game to the script.
  echo "# Welcome! ConShell is an open source game engine`n# for PowerShell.`n# Here is a simple game for you.`necho Hello World!`necho Use ConShell to develop`necho simple powershell games." >> "$name.ps1"
  $logdate = Get-Date
  echo "---------------------------`nOn $logdate game created via ConShell`nGAME NAME: $global:name`nPATH: $global:games" >> cshell.log
  echo "Inited empty CShell game in $global:games, name $global:name"
  notepad $global:name.ps1
  return
} else {
  
  echo "Launching editor."
  notepad "$global:name".ps1
}
trap {
  $logdate = Get-Date
  echo "---------------------------`nOn $logdate bug occured`nBUG: $_" >> cshell.log
  echo "An internal error has occured. Bug: $_`nPlease report this bug to ControllerShell.`nGuru Meditation."
  echo "Logged."

  Start-Sleep 1
  exit
}
