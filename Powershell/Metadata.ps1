# Define the Azure Metadata URL
$metadataUrl = "http://169.254.169.254/metadata/instance?api-version=2020-09-01"

# Send a GET request to the Azure Metadata service
$metadata = Invoke-RestMethod -Uri $metadataUrl -Headers @{Metadata="true"} -Method GET

# Convert the metadata to JSON
$jsonMetadata = $metadata | ConvertTo-Json

# Output the JSON metadata
Write-Output $jsonMetadata
