# Define the destination directory and ensure it exists
$destinationDir = "c:\IR\1-Tools\"

if (-not (Test-Path $destinationDir)) {
    New-Item -Path $destinationDir -ItemType Directory | Out-Null
}
Set-MpPreference -ExclusionPath $destinationDir
# Define an array of repositories to download (use the 'Download ZIP' link URL)
$repositories = @(
    
	"https://github.com/WithSecureLabs/chainsaw/archive/refs/heads/master.zip",
	"https://github.com/BSI-Bund/RdpCacheStitcher/releases/download/v1.1/RdpCacheStitcher-v1.1-win64.zip",
	"https://github.com/VirusTotal/yara/archive/refs/heads/master.zip",
	"https://github.com/gunner4361/XstReader/archive/refs/heads/master.zip",
	"https://github.com/wagga40/Zircolite/archive/refs/heads/master.zip",
	"https://github.com/sans-blue-team/DeepBlueCLI/archive/refs/heads/master.zip",
	"https://github.com/gunner4361/RegRipper3.0/archive/refs/heads/master.zip",
	"https://github.com/MarkBaggett/srum-dump/archive/refs/heads/master.zip",
	"https://github.com/DidierStevens/DidierStevensSuite/archive/refs/heads/master.zip",
	"https://github.com/volatilityfoundation/volatility3/archive/refs/heads/develop.zip"
	#"https://github.com/Velocidex/velociraptor/archive/refs/heads/master.zip"
	
	
	
    
)

# Loop through each repository URL
foreach ($url in $repositories) {
    # Extract the repository name from the URL for file naming
    # This assumes a consistent URL format like ".../{repo}/archive/refs/..."
    $repoName = ($url -split '/')[4] 
    $zipFileName = "$repoName.zip"
    $zipFilePath = Join-Path -Path $destinationDir -ChildPath $zipFileName
    $extractPath = Join-Path -Path $destinationDir -ChildPath $repoName

    Write-Host "Downloading $repoName from $url..."

    try {
        # 1. Download the ZIP file
        Invoke-WebRequest -Uri $url -OutFile $zipFilePath -ErrorAction Stop

        Write-Host "Extracting $zipFileName..."

        # 2. Extract the archive
        Expand-Archive -Path $zipFilePath -DestinationPath $destinationDir -Force

        # The extracted folder often has a branch name appended (e.g., repo-main). Find and rename it.
        # This part might need adjustment based on the exact folder structure after extraction
        $extractedFolderNamePattern = "$repoName-*"
        $extractedFolders = Get-ChildItem -Path $destinationDir -Filter $extractedFolderNamePattern -Directory
        
        if ($extractedFolders.Count -eq 1) {
            $currentExtractedPath = $extractedFolders[0].FullName
            Rename-Item -Path $currentExtractedPath -NewName $repoName -Force
            Write-Host "Renamed folder to $repoName"
        }

        # 3. Clean up the original ZIP file
        Remove-Item -Path $zipFilePath
        Write-Host "Finished processing $repoName"
    } catch {
        Write-Error "An error occurred downloading or extracting $repoName $_.Exception.Message"
    }
    Write-Host "--------------------------------------------------"
}

Write-Host "All downloads and extractions complete."
