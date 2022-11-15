<#

Name: Upload-To-Storage-Container.ps1
Version: 2
Author: Abbia Zacharia

Purpose: 
Upload local files to Azure storage container

Description:

Version Control:

Prerequisites:

Configurations:

#>

#==================================================================================

function StorageUpload()
{

# Select file
Write-Host "Example: C:\temp\sample.txt" -ForegroundColor Blue
$file = Read-Host -Prompt "Enter full path for file to be uploaded"
$name = (Get-Item $file).Name
$uri = "https://$storagename.blob.core.windows.net/$containername/$($name)?$unsecuretoken"
$headers = @{
    'x-ms-blob-type' = 'BlockBlob'
}

# Upload file
Write-Host "Upload started" -ForegroundColor Yellow
Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -InFile $file -ErrorAction Stop
Write-Host "$name uploaded to $containername" -ForegroundColor Green
}

# Code is executing from here
Write-Host "`nPowerShell to upload local files to Azure storage container" -ForegroundColor Yellow
Write-Host "************************" -ForegroundColor White -BackgroundColor Black
Write-Host "Time to supply AZ storage details" -ForegroundColor Red
$storagename = Read-Host -Prompt "Enter the name of the storage account"
$containername = Read-Host -Prompt "Enter the name of the container"
$sastoken = Read-Host -Prompt "Enter SAS token to access $containername (shared access signature)" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($sastoken)
$unsecuretoken = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

StorageUpload
$confirmation = Read-Host "Do you want to upload one more file? y/n"
if ($confirmation -eq 'y') 
{
StorageUpload
}
else
{
exit
}

#==================================================================================
