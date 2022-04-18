IT admins sometimes need to collect specific files from end user systems. If they already know the location and filename, it is possible to deploy a PowerShell script using different management tools to collect the file
While there are multiple ways to do the copy, this is just one of the ways https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-blobs-upload

In this repo, we have:
1. Steps.pdf – which contains detailed steps for creating a storage account, container and how to use the script 
2. Upload-to-azure-blob.ps1 – which is the actual PowerShell script that does the upload, and which needs to be deployed to user computers. It needs to be modified according to your environment or configuration
