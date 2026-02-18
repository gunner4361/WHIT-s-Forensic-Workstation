WHIT’s Forensics Workstation Setup

This setup is accomplished with powershell scripts that allow custimization. The scripts are written for PS 7+.  It installs some of the tools using winget, others are downloaded from Github or other links. Tools are listed in “WHIT-Forensic-Tools.csv” Some steps are taken to remove applications that are not needed. 


There are several steps to getting a forensic system up and running:
I find at least 16GB of Ram and 100GB of Disk is a good starting point.

Bios setup In VMWARE
 

OS installation
Install Windows 11
Install PS v7 - PS>winget install --id Microsoft.PowerShell --source winget

Copy Files to C:\Setup
Update Windows run “WHIT-update.ps1’ 



Setup


Review the following files, understand what they do, modify them to fit your needs.
Whit-setup.ps1  - Main Script
WHIT-Winget-Install.ps1 - Installs Winget applications
whit-DL-FT-from-gh.ps1 - Downloads zip files from GITHUB
whit-DL-FT-urls.ps1 - Downloads applications from URL’s, Check sites for current versions
WHIT-remove-apps.ps1 - Removes applications not needed
WHIT-win11-reg-changes.reg - Sets different registry settings
WHIT-C-Menu.reg - Creates explorer right click context menu
AppsToRemove.txt - List of applications to remove


Then run the script  whit-setup.ps1

This will create the C:\IR folder structure

C:\ir\1-Tools>
CLIENT-TOOLS
EVENTLOGS
EZ
FORENSICS
IMAGE
MAIL
MALWARE
MEMORY
NETWORK
UTIL

WHIT-Winget-Install.ps1
This script installs applications that can be installed via Winget.
Review the script for the list of Applications


whit-DL-FT-from-gh.ps1
This script downloads applications from GITHUB zip. The idea here is these should not need changing when updates are made to the GITHUB.

whit-DL-FT-urls.ps1
Downloads from specific URL’s these will need to be checked for updates.


WHIT-win11-reg-changes.reg
This file modifies the registry with the following settings:

Show hidden folders
Start File Explorer on "This PC"
Move Start Menu to the Left
Disable Advertising for current user
Disable Tailored experiences with diagnostic data for Current User
Disable Online Speech Recognition
Disable - Improve Inking & Typing Recognition
Disables "Tailored Experiences" (personalized tips, ads, and recommendations)
Disable Let Windows improve Start and search results by tracking app launches
Disable Activity History
Set Feedback Frequency to Never
Disable personalization of ads, Microsoft Edge, search, news and other Microsoft services by sending browsing history, favorites and collections, usage and other browsing data to Microsoft
Disable required and optional diagnostic data about browser usage
Hide Search box or Search icon
Disable new context menu
Disable the Fast Startup feature in Windows (10/11), forcing a full shutdown instead of a hybrid hibernation state

WHIT-C-Menu.reg
The file “WHIT-C-Menu.reg” sets up a right click context menu 

HxD
ExIfTool
PESTudio
TimelineExplorer
RegistryExplorer.exe
Nirsoft EventViewer

WHIT-remove-apps.ps1
This script loops through “AppsToRemove.txt” trying to remove the applications in the list.
This script IMO takes too long.
 
Add ps shortcut
PS 7 should run with Admin rights
c:\setup\whit-ps-sc.ps1



To update winget packages
PS> winget update –all
