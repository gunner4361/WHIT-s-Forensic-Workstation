# Install the PSWindowsUpdate module (if not already installed)
Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser

# Import the module into the current session
Import-Module PSWindowsUpdate

# Check for updates, accept all, install, and automatically reboot if needed
Get-WindowsUpdate -AcceptAll -Install -AutoReboot -MicrosoftUpdate
