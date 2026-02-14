# Define the path to your text file
$AppListFile = "C:\setup\AppsToRemove.txt"

# Read the app names from the text file
$Apps = Get-Content -Path $AppListFile

# Loop through each app name and attempt to uninstall it

foreach ($AppName in $Apps) {
    Write-Host "Attempting to uninstall: $AppName" -ForegroundColor Cyan

    # --- Attempt to uninstall Windows App Package (UWP) for the current user ---
    try {
        Get-AppxPackage *$AppName* | Remove-AppxPackage
        Write-Host "Successfully removed AppXPackage for current user: $AppName" -ForegroundColor Green
    } catch {
        Write-Host "Could not remove AppXPackage for current user: $AppName. Error: $_.Exception.Message" -ForegroundColor Yellow
    }

    # --- Attempt to uninstall Windows App Package (UWP) for all users and provisioned package ---
    # Note: Removing for all users/provisioned requires the exact PackageFullName in some cases
    # The following commands attempt a broader removal if the simple name is used with wildcards.
    try {
        Get-AppxPackage -AllUsers *$AppName* | Remove-AppxPackage -AllUsers
        Write-Host "Successfully removed AppXPackage for all users: $AppName" -ForegroundColor Green
    } catch {
        Write-Host "Could not remove AppXPackage for all users: $AppName. Error: $_.Exception.Message" -ForegroundColor Yellow
    }

    try {
        # This removes the app for future users
        Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like "*$AppName*"} | Remove-AppxProvisionedPackage -Online
        Write-Host "Successfully removed provisioned package: $AppName" -ForegroundColor Green
    } catch {
        Write-Host "Could not remove provisioned package: $AppName. Error: $_.Exception.Message" -ForegroundColor Yellow
    }

    # --- Attempt to uninstall traditional desktop application (Win32, MSI-based) ---
    # Using Win32_Product can be slow, an alternative is using the UninstallString from the registry
    try {
        $desktopApp = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match $AppName}
        if ($desktopApp) {
            $desktopApp.Uninstall()
            Write-Host "Successfully uninstalled desktop app: $AppName" -ForegroundColor Green
        } else {
            Write-Host "Desktop app not found: $AppName" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Could not uninstall desktop app: $AppName. Error: $_.Exception.Message" -ForegroundColor Yellow
    }

    Write-Host "Finished processing: $AppName" -ForegroundColor Cyan
    Write-Host ""
}
