# Define the path for the debloat folder
$DebloatFolder = "C:\ProgramData\Debloat"

# Check if the folder exists
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
} Else {
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep -Seconds 1  # Specify the unit of time for clarity
    New-Item -Path $DebloatFolder -ItemType Directory -Force  # Use -Force to handle existing paths
    Write-Output "The folder $DebloatFolder was successfully created."
}

# Define the path for the template file
$templateFilePath = "C:\ProgramData\Debloat\removebloat.ps1"

# Download the script
Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/clement-leung/Club-L/main/RemoveBloat.ps1" `
    -OutFile $templateFilePath `
    -UseBasicParsing `
    -Headers @{"Cache-Control"="no-cache"}

# Populate between the speech marks any apps you want to whitelist, comma-separated
$arguments = ' -customwhitelist ""'

# Execute the downloaded script with the specified arguments
& $templateFilePath $argumentsBloat
