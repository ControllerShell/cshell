$v = 1.0
cls
echo "╔═══╗─────╔═══╦╗────╔╗╔╗"

echo "║╔═╗║─────║╔═╗║║────║║║║"

echo "║║─╚╬══╦═╗║╚══╣╚═╦══╣║║║"

echo "║║─╔╣╔╗║╔╗╬══╗║╔╗║║═╣║║║"

echo "║╚═╝║╚╝║║║║╚═╝║║║║║═╣╚╣╚╗"

echo "╚═══╩══╩╝╚╩═══╩╝╚╩══╩═╩═╝"
echo ".        VERSION $v"
Start-Sleep -s 3
cls

Start-Sleep -ms 100
echo "BSD 2-Clause License"
echo ""
echo "Copyright 2022 ControllerShell"

echo "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:"

echo "   1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer."

echo "   2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution."

echo "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
Read-Host "Press Enter to accept this license."
cls
echo "ConShell $v"
$games = cd
if (-not Test-Path $games/games) {
  if (-not $IsLinux) {
    $Setup = Show-MessageBox "Welcome to CShell! The app could not locate a CShell workspace. Set up the workspace?" "ConShell" -Buttons YesNo -Icon Question
    if ($Setup -eq No) { 
      echo "You decided not to setup the workspace. CShell requires a workspace. Exiting."

      Wait-Sleep -s 5
      exit
    }
    Add-Item $games/games --ItemType directory
  }
  else
    {
      echo "Welcome to CShell! The app çould not locate a workspace. Please create one in $games/games."
      while (!(Test-Path "C:\flag.txt")) { Start-Sleep 1 }
    }
  
}
cd games
echo "GAMES:"
Get-ChildItem -Path "$games/games" -Filter *.ps1 -r | % { $_.Name.Replace( ".ps1","") }
$name = Read-Host 'Enter the name of the game to create. You can edit it later in your local notepad.'
Add-Item "$name.ps1"
echo "# Welcome! ConShell is an open source game engine`n# for PowerShell.`n# Here is a simple game for you.`necho Hello World!`necho Use ConShell to develop`necho simple powershell games." >> "$name.ps1"

echo "Game created. Launching editor."
Start-Sleep -s 3
notepad $name.ps1
exit
