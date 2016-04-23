# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-S3ObjectCount
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# Get all top-level directories:
# . ./lib.ps1
# Get-S3ObjectCount -BucketName 'myBucket'
#
# Get all directories recursively:
# . ./lib.ps1
# Get-S3ObjectCount -BucketName 'myBucket' -KeyPrefix 'myFolder'
#
# EXAMPLE OUTPUT:
# 10
# --------------------------------------------------------------------------------
function Get-S3ObjectCount
{
  [CmdletBinding()]
  param
  (
    [string] $BucketName,
	[string] $KeyPrefix
  )
  
  $getS3Object = 'get-s3object -BucketName $BucketName'
  if($KeyPrefix)
  {
    $getS3Object = $getS3Object, '-KeyPrefix $KeyPrefix' -join ' '
  }
  
  $scriptBlockString = "@($getS3Object) | Out-Null"
  
  Write-Debug $scriptBlockString
  
  $scriptblock = [scriptblock]::Create($scriptBlockString)
  
  Invoke-Command -ScriptBlock $scriptblock
  
  $AWSHistory.LastCommand.EmittedObjectsCount
}