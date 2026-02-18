#
#Requires -RunAsAdministrator
Start-Transcript -OutputDirectory c:\setup


mkdir c:\ir
mkdir c:\ir\0-Reference
mkdir c:\ir\0-Reference\posters
mkdir c:\ir\0-Reference\cheatsheets
mkdir c:\ir\0-Reference\Networking
mkdir c:\ir\1-Tools
mkdir c:\ir\1-Tools\Forensics
mkdir c:\ir\1-Tools\IMAGE
mkdir c:\ir\1-Tools\MEMORY
mkdir c:\ir\1-Tools\EVENTLOGS
mkdir c:\ir\1-Tools\NETWORK
mkdir c:\ir\1-Tools\EZ
mkdir c:\ir\1-Tools\UTIL
mkdir c:\ir\1-Tools\UTIL\Nirsoft
mkdir c:\ir\1-Tools\FORENSICS\RDP
mkdir c:\ir\1-Tools\MAIL
mkdir c:\ir\1-Tools\MALWARE
mkdir c:\ir\1-Tools\CLIENT-TOOLS

Set-MpPreference -ExclusionPath "C:\IR"

# Add apps using WINGET
& "C:\setup\WHIT-Winget-Install.ps1"

# Add apps from GITHUB zip
& "C:\setup\whit-DL-FT-from-gh.ps1"

# Add apps from specific URLS for example github release
& "C:\setup\whit-DL-FT-urls.ps1"

# Add Eric Zimmerman Tools
& ".\Get-ZimmermanTools.ps1" -Dest c:\ir\1-Tools\EZ

##& xcopy "..\Arsenal-Imagce-Mounter-v3.6.188" c:\ir\1-Tools\IMAGE\AIM  /E /I /H
##& copy "..\cdqr.exe" c:\ir\1-Tools\Forensics\"

###& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\eventlook*"  -o"c:\IR\1-Tools\EVENTLOGS\"

###hayabusa-3.7.0-all-platforms

#
#Clean up folders
#Move-Item -Path "C:\SourceFolder" -Destination
Move-Item -Path "C:\ir\1-Tools\chainsaw" -Destination "c:\ir\1-Tools\EVENTLOGS"
Move-Item -Path "C:\ir\1-Tools\DeepBlueCLI" -Destination "c:\ir\1-Tools\EVENTLOGS"
Move-Item -Path "C:\ir\1-Tools\Zircolite" -Destination "c:\ir\1-Tools\EVENTLOGS"
Move-Item -Path "C:\ir\1-Tools\xstreader" -Destination "c:\ir\1-Tools\MAIL"
Move-Item -Path "C:\ir\1-Tools\go-winpmem*" -Destination "c:\ir\1-Tools\IMAGE"
Move-Item -Path "C:\ir\1-Tools\DidierStevensSuite" -Destination "c:\ir\1-Tools\FORENSICS"
Move-Item -Path "C:\ir\1-Tools\RdpCacheStitcher_Windows_x64" -Destination "c:\ir\1-Tools\FORENSICS\RDP"
Move-Item -Path "C:\ir\1-Tools\RegRipper3.0" -Destination "c:\ir\1-Tools\FORENSICS"
Move-Item -Path "C:\ir\1-Tools\srum-dump" -Destination "c:\ir\1-Tools\FORENSICS"
Move-Item -Path "C:\ir\1-Tools\CyLR_win-x64.zip" -Destination "c:\ir\1-Tools\client-tools"
Move-Item -Path "C:\ir\1-Tools\uac*" -Destination "c:\ir\1-Tools\client-tools"
Move-Item -Path "C:\ir\1-Tools\Yara" -Destination "c:\ir\1-Tools\Malware"
Move-Item -Path "C:\ir\1-Tools\cdqr.exe" -Destination "c:\ir\1-Tools\FORENSICS"
Move-Item -Path "C:\ir\1-Tools\velociraptor*" -Destination "c:\ir\1-Tools\client-tools"
Move-Item -Path "C:\ir\1-Tools\CobaltStrikeScan.exe" -Destination "c:\ir\1-Tools\malware"
Move-Item -Path "C:\ir\1-Tools\SQLiteDatabaseBrowserPortable_3.13.1.paf.exe" -Destination "c:\ir\1-Tools\Forensics"


##& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\eventlook*"  -o"c:\IR\1-Tools\EVENTLOGS\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\CyberChef*" -o"c:\ir\1-Tools\FORENSICS\CC"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\sleuthkit*" -o"c:\ir\1-Tools\FORENSICS\TSK"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\hayabusa*"  -o"c:\IR\1-Tools\\EVENTLOGS\hayabusa"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\takajo*"  -o"c:\IR\1-Tools\\EVENTLOGS\takajo\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\networkminer*"  -o"c:\IR\1-Tools\Network\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\dd*" -o"c:\IR\1-Tools\IMAGE\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\FTK*" -o"c:\IR\1-Tools\IMAGE\FTK"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\pestudio.zip" -o"c:\IR\1-Tools\Malware\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\setup\exiftool*" -o"c:\IR\1-Tools\FORENSICS\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\ir\1-Tools\eventlook*"  -o"c:\IR\1-Tools\\EVENTLOGS\EVENTLOOK"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\Memproc*" -o"c:\IR\1-Tools\Memory\MemProc"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\volatility_2.6_win64_standalone.zip" -o"c:\IR\1-Tools\Memory\volatility_2.6"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\volatility3-win-exes-2.27.0.zip" -o"c:\IR\1-Tools\Memory\volatility3"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\tftpd64_portable_v4.74.zip" -o"c:\IR\1-Tools\Network\TFTP"
& "C:\Program Files\7-Zip-Zstandard\7z" x "C:\ir\1-Tools\master.zip"  -o"C:\ir\1-Tools\FORENSICS\RDP\"

curl.exe -L -e  'https://www.nirsoft.net/packages/' -o "c:\ir\1-Tools\passrecenc.zip" 'https://www.nirsoft.net/packages/passrecenc.zip'
curl.exe -L -e  'https://www.nirsoft.net/packages/' -o "c:\ir\1-Tools\systools.zip" 'https://www.nirsoft.net/packages/systools.zip'
curl.exe -L -e  'https://www.nirsoft.net/packages/' -o "c:\ir\1-Tools\brtools.zip" 'https://www.nirsoft.net/packages/brtools.zip'
curl.exe -L -e  'https://www.nirsoft.net/packages/' -o "c:\ir\1-Tools\x64tools.zip" 'https://www.nirsoft.net/packages/x64tools.zip'   

& "C:\Program Files\7-Zip-Zstandard\7z" x -pnirsoft123! "c:\ir\1-Tools\x64tools.zip"  -o"C:\ir\1-Tools\UTIL\Nirsoft"
& "C:\Program Files\7-Zip-Zstandard\7z" x -pnirsoft123! "c:\ir\1-Tools\passrecenc.zip"  -o"C:\ir\1-Tools\UTIL\Nirsoft"
& "C:\Program Files\7-Zip-Zstandard\7z" x -pnirsoft123! "c:\ir\1-Tools\brtools.zip"  -o"C:\ir\1-Tools\UTIL\Nirsoft"
& "C:\Program Files\7-Zip-Zstandard\7z" x -pnirsoft123! "c:\ir\1-Tools\systools.zip"  -o"C:\ir\1-Tools\UTIL\Nirsoft"


	
	
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\setup\networking.zip" -o"C:\ir\0-Reference\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\setup\posters.zip" -o"C:\ir\0-Reference\"
& "C:\Program Files\7-Zip-Zstandard\7z" x "c:\setup\cheatsheets.zip" -o"C:\ir\0-Reference\"


## clean up exiftool
Rename-Item  -Path "c:\ir\1-Tools\forensics\exiftool-13.50_64" -NewName "c:\ir\1-Tools\forensics\exiftool"
Rename-Item  -Path "c:\ir\1-Tools\forensics\exiftool\exiftool(-k).exe -NewName "c:\ir\1-Tools\forensics\exiftool\exiftool.exe
& "C:\ir\1-Tools\osfmount"

# Clean up
Remove-Item -Path "c:\ir\1-Tools\hayabusa*"
Remove-Item -Path "c:\ir\1-Tools\eventlook*" 
Remove-Item -Path "c:\ir\1-Tools\takajo*"
Remove-Item -Path "c:\ir\1-Tools\networkminer*"
Remove-Item -Path "C:\ir\1-Tools\CyberChef*"
Remove-Item -Path "c:\ir\1-Tools\dd*"
Remove-Item -Recurse -Force -Path "c:\ir\1-Tools\volatility*"
Remove-Item -Path "C:\ir\1-Tools\osfmount*"
Remove-Item -Path "C:\ir\1-Tools\FIV.Setup.exe" 
Remove-Item -Path "C:\ir\1-Tools\tftpd6*"
Remove-Item -Path "C:\ir\1-Tools\sleuthkit*"
Remove-Item -Path "C:\ir\1-Tools\bmc-tools*" -recurse -Confirm:$false  -force
Remove-Item -Path "C:\ir\1-Tools\Memproc*"
Remove-Item -Path "C:\ir\1-Tools\pestudio*"
Remove-Item -Path "C:\ir\1-Tools\master*"

## Install WSL
wsl –install
wsl --set-default-version 2
wsl --install -d Ubuntu-24.04

## add ps shortcut
& c:\setup\whit-ps-sc.ps1


# Add Right Click Context Menu
##WHIT-C-Menu.reg
Start-Process -FilePath "regedit.exe" -ArgumentList "/s c:\setup\WHIT-C-Menu.reg" -Wait

# Remove Apps that add crap to the system
# Review file AppsToRemove
[Console]::Beep(500, 300)
$confirmation = Read-Host -Prompt "Do you want to Remove apps that are not needed? (Y/N)"
 Write-Host "Review file AppsToRemove"
if ($confirmation -eq 'Y') {
    Write-Host "Making changes"
	&  .\WHIT-remove-apps.ps1
    # 
} else {
    Write-Host "Leaving apps"
}


# Make changes to the system via registry settings
[Console]::Beep(500, 300)
$confirmation = Read-Host -Prompt "Do you want to Modify the Registry? (Y/N)"
 Write-Host "Review file WHIT-win11-reg changes"
if ($confirmation -eq 'Y') {
    Write-Host "Making changes"
	& Start-Process -FilePath "regedit.exe" -ArgumentList "/s c:\setup\WHIT-win11-reg-changes.reg" -Wait
    # 
} else {
    Write-Host "Skipping Registry Changes"
}




