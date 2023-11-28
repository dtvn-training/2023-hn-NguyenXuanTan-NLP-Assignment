# PowerShell Script

# Define variables
$datasetsDir = "utils\datasets"
$zipFile = "stanfordSentimentTreebank.zip"
$downloadUrl = "http://nlp.stanford.edu/~socherr/stanfordSentimentTreebank.zip"

# Create datasets directory
New-Item -ItemType Directory -Path $datasetsDir -Force | Out-Null

# Change to datasets directory
Set-Location $datasetsDir

# Get Stanford Sentiment Treebank
if (Test-Path (Get-Command wget -ErrorAction SilentlyContinue)) {
    # If wget is available, use it
    wget $downloadUrl -OutFile $zipFile
} else {
    # If wget is not available, use Invoke-WebRequest
    Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile
}

# Unzip the downloaded file
Expand-Archive -Path ".\$zipFile" -DestinationPath .

# Remove the downloaded zip file
Remove-Item -Path ".\$zipFile"
