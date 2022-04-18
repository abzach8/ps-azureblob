# Change execution policy
# Set-ExecutionPolicy Unrestricted -Scope CurrentUser

# Start logging
$logfilepath="C:\temp\upload-to-azureblob-script.log"
Start-Transcript -Path $logfilepath

# Specify file to upload
$file = "C:\temp\sample.txt"
$name = (Get-Item $file).Name

# Target URL format = SAS-URL/Container/Folder/$name?SAS-token
$uri = "https://abzachstorageaccount.blob.core.windows.net/sample-container/$($name)?{your-SAS-token}"
# Required headers
$headers = @{
    'x-ms-blob-type' = 'BlockBlob'
}

# Uploading file
Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -InFile $file

# Stop logging
Stop-Transcript