# Sets the version and produces the splash screen.
$v = 1.0
cls
echo "╔═══╗─────╔═══╦╗────╔╗╔╗"

echo "║╔═╗║─────║╔═╗║║────║║║║"

echo "║║─╚╬══╦═╗║╚══╣╚═╦══╣║║║"

echo "║║─╔╣╔╗║╔╗╬══╗║╔╗║║═╣║║║"

echo "║╚═╝║╚╝║║║║╚═╝║║║║║═╣╚╣╚╗"

echo "╚═══╩══╩╝╚╩═══╩╝╚╩══╩═╩═╝"
echo "        VERSION $v - FREE AND OPEN SOURCE"
Start-Sleep -s 3
cls

Start-Sleep -ms 100
# Stop if user is on Windows PowerShell. For the FOSS version of PowerShell, it should return "core". Try "echo $PSVersionTable.PSEdition".
if ($PSVersionTable.PSEdition -ne "Core") {
  Read-Host "Sorry, ControllerShell is currently only supported for PowerShell Core. Stay tuned for Windows PowerShell support. ;)"
  exit
}
# Add a license agreement warning. This renders the BSD 2-clause license used by CShell.
echo "BSD 2-Clause License"
echo ""
echo "Copyright 2022 ControllerShell"

echo "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:"

echo "   1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer."

echo "   2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution."

echo "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
echo "CShell uses PWSH vim, licensed under the MIT license: https://choosealicense.com/licenses/mit"
Read-Host "Press Enter to accept this license."
cls
echo "ConShell $v"
$games = cd
# Asks the user to set up the workspace. On Windows and macOS, this renders as
# a message box. On GNU/Linux, the user must manually create the workspace.
if (-not Test-Path $games/games) {
  if (-not $IsLinux) {
    $Setup = Show-MessageBox "Welcome to CShell! The app could not locate a CShell workspace. Set up the workspace?" "ConShell" -Buttons YesNo -Icon Question
    if ($Setup -eq No) { 
      echo "You decided not to setup the workspace. CShell requires a workspace. Exiting."

      Start-Sleep -s 2
      exit
    }
    Add-Item $games/games --ItemType directory
  }
  else {
      echo "Welcome to CShell! The app çould not locate a workspace. Please create one in $games/games."
      while (!(Test-Path "$games/games")) { Start-Sleep 1 }
    }
}
cd games
# Installs required dependencies, usally the editor.
echo "Installing dependencies"
Install-Module vim -Force
# List all games in the workspace.
echo "GAMES:"
Get-ChildItem -Path "$games/games" -Filter *.ps1 -r | % { $_.Name.Replace( ".ps1","") }
# Adds an input requesting a user to add a new game to the workspace.
$name = Read-Host 'Enter the name of the game to create. You can edit it later in your local notepad.'
Add-Item "$name.ps1"
# Add a beginner game to the script.
echo "# Welcome! ConShell is an open source game engine`n# for PowerShell.`n# Here is a simple game for you.`necho Hello World!`necho Use ConShell to develop`necho simple powershell games." >> "$name.ps1"

echo "Game created. Launching editor."
Start-Sleep -s 3
vim $name.ps1

