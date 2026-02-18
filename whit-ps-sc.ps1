# 1. Dynamically get the REAL Desktop path (handles OneDrive)
$desktopPath = [Environment]::GetFolderPath("Desktop")
$pwshPath = "C:\Program Files\PowerShell\7\pwsh.exe"
$shortcutName = "PowerShell 7 Admin.lnk"
$shortcutPath = Join-Path $desktopPath $shortcutName

# 2. Create the shortcut
$shell = New-Object -ComObject WScript.Shell
$lnk = $shell.CreateShortcut($shortcutPath)
$lnk.TargetPath = $pwshPath
$lnk.Save()

# 3. Force "Run as Administrator" (Flips byte 21)
$bytes = [System.IO.File]::ReadAllBytes($shortcutPath)
$bytes[0x15] = $bytes[0x15] -bor 0x20 
[System.IO.File]::WriteAllBytes($shortcutPath, $bytes)

# 4. Pin to Taskbar
$shellApp = New-Object -ComObject Shell.Application
$folder = $shellApp.Namespace($desktopPath)
$item = $folder.ParseName($shortcutName)

if ($item) {
    $item.InvokeVerb("taskbarpin")
    Write-Host "Success! PowerShell 7 Admin is now on your taskbar." -ForegroundColor Green
} else {
    Write-Warning "Shortcut created on Desktop, but Windows blocked the auto-pin. Please right-click the 'PowerShell 7 Admin' icon on your desktop and select 'Pin to taskbar'."
}
