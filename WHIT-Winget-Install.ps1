#
# Set execution policy to bypass for the current session to allow script execution
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
#
## https://winget.run/search?query=eventlook
#
# Define an array of applications to install
$appsToInstall = @(
	"Microsoft.PowerShell"
	"Microsoft.PowerToys"
	"mcmilk.7zip-zstd"
    "Suite Microsoft.Sysinternals.Suite"
    "Google.Chrome"
    "Mozilla.Firefox"
    "VideoLAN.VLC"
     "PuTTY.PuTTY"
     "Notepad++.Notepad++"
	"MHNexus.HxD"
	"Greenshot.Greenshot"
	"WinSCP.WinSCP"
	"Microsoft.Azure.AZCopy.10"
	"Microsoft.Azure.StorageExplorer"
	"dnGrep.dnGrep"
	"Insecure.Nmap"
	"WiresharkFoundation.Wireshark"
	"SleuthKit.Autopsy"
	"IrfanSkiljan.IrfanView"
    "dnGrep.dnGrep"
	"Insecure.Nmap"
	"WiresharkFoundation.Wireshark"
	"SleuthKit.Autopsy"
	##"OliverBetz.ExifTool"
	"Eventlook"
)
# Loop through the array and install each application
foreach ($app in $appsToInstall) {
    Write-Host "Attempting to install $app..."
    winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$app installed successfully."
    } else {
        Write-Host "Error installing $app. Exit code: $LASTEXITCODE"
    }
}

Write-Host "Installation script complete."