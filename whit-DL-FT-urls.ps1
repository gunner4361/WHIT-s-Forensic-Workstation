# Define the URLs to download
# Used for specific URLs
$urls = @(
    ###
	'https://d1kpmuwb7gvu1i.cloudfront.net/Special/ImagerPro/FTK%20Imager%208.2.0_SP1.iso',
	'https://github.com/Yamato-Security/hayabusa/releases/download/v3.7.0/hayabusa-3.7.0-all-platforms.zip',
	'https://github.com/Yamato-Security/takajo/releases/download/v2.15.0/takajo-2.15.0-all-platforms.zip',
	'https://github.com/kmaki565/EventLook/releases/download/1.0.8.0/EventLook-bf49885fb5888e20b16b94645c74fee8167c8b0f.zip',
    'https://www.osforensics.com/downloads/osfmount.exe',
	'https://github.com/volatilityfoundation/volatility/releases/download/2.6.1/volatility_2.6_win64_standalone.zip',
	'https://github.com/volatilityfoundation/volatility3/releases/download/v2.27.0/volatility3-win-exes-2.27.0.zip',
	'https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.14.0/sleuthkit-4.14.0-win32.zip',
	##'https://github.com/ufrisk/MemProcFS/releases/download/v5.16/MemProcFS_files_and_binaries-win_x64-latest.zip',
	'https://github.com/orlikoski/CDQR/releases/download/20191226/cdqr.exe',
	'https://download.netresec.com/networkminer/NetworkMiner_3-1.zip',
	'http://www.chrysocome.net/downloads/dd-0.3.zip',
	'https://github.com/PJO2/tftpd64/releases/download/v4.74/tftpd64_portable_v4.74.zip',
	'https://github.com/tclahr/uac/releases/download/v3.2.0/uac-3.2.0.tar.gz',
	'https://github.com/orlikoski/CyLR/releases/download/2.2.0/CyLR_win-x64.zip',
	'https://github.com/Velocidex/WinPmem/releases/download/v4.0.rc1/go-winpmem_amd64_1.0-rc2_signed.exe',
	'https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2%20-%20Windows/dc3dd-windows-64bit-7-2-641.zip/download',
	'https://github.com/nevaran/FIV/releases/download/0.11.0.1/FIV.Setup.exe',
	'https://github.com/Velocidex/velociraptor/releases/download/v0.75/velociraptor-v0.75.6-windows-amd64.exe',
	'https://github.com/ufrisk/MemProcFS/releases/download/v5.16/MemProcFS_files_and_binaries-win_x64-latest.zip',
	'https://www.winitor.com/tools/pestudio/current/pestudio.zip',
	'https://github.com/gunner4361/bmc-tools/archive/refs/heads/master.zip',
	'https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v3.13.1/SQLiteDatabaseBrowserPortable_3.13.1.paf.exe',
	'https://github.com/Apr4h/CobaltStrikeScan/releases/download/1.1.2/CobaltStrikeScan.exe',
	'https://github.com/gchq/CyberChef/releases/download/v10.20.0/CyberChef_v10.20.0.zip'
)

# Define the destination folder
$destinationFolder = 'c:\IR\1-Tools\'

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Loop through each URL and download the file
foreach ($url in $urls) {
    # Extract the filename from the URL
    $fileName = Split-Path -Path $url -Leaf
    
    # Combine the destination folder path and filename
    $outputPath = Join-Path -Path $destinationFolder -ChildPath $fileName
    
    Write-Host "Downloading '$url' to '$outputPath'..."
    
    try {
        # Download the file
        Invoke-WebRequest -Uri $url -OutFile $outputPath -ErrorAction Stop
        Write-Host "Successfully downloaded '$fileName'." -ForegroundColor Green
    }
    catch {
        Write-Host "Error downloading '$url': $($_.Exception.Message)" -ForegroundColor Red
    }
}
