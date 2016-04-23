# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-S3ObjectCommonPrefixes 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# Get all top-level directories:
# . ./lib.ps1
# Get-S3ObjectCommonPrefixes -BucketName 'myBucket'
#
# Get all directories recursively:
# . ./lib.ps1
# Get-S3ObjectCommonPrefixes -BucketName 'myBucket' -Recurse
#
# EXAMPLE OUTPUT:
# myprefix/
# myprefix/txt/
# myprefix/img/
# myotherprefix/
# ...
# --------------------------------------------------------------------------------
function Get-CommonPrefixes
{
  param
  (
    [Parameter(Mandatory=$true)][string] $BucketName,
    [string] $KeyPrefix = '/',
    [Switch] $Recurse
  )

  @(get-s3object -BucketName $BucketName -KeyPrefix $KeyPrefix -Delimiter '/') | Out-Null

  if($AWSHistory.LastCommand.Responses.Last.CommonPrefixes.Count -gt 0)
  {
    $AWSHistory.LastCommand.Responses.Last.CommonPrefixes

    if($Recurse)
    {
      $AWSHistory.LastCommand.Responses.Last.CommonPrefixes | % { Get-Subdirectories -BucketName $BucketName -KeyPrefix $_ -Recurse $Recurse }
    }
  }
}

# --------------------------------------------------------------------------------
# USAGE:
# Get all top-level directories:
# . ./lib.ps1
# Get-S3ObjectCommonPrefixes -BucketName 'myBucket'
#
# Get all directories recursively:
# . ./lib.ps1
# Get-S3ObjectCommonPrefixes -BucketName 'myBucket' -Recurse
#
# EXAMPLE OUTPUT:
# myprefix/
# myprefix/txt/
# myprefix/img/
# myotherprefix/
# ...
# --------------------------------------------------------------------------------
function Get-S3ObjectCommonPrefixes
{
  param
  (
    [Parameter(Mandatory=$true)][string] $BucketName,
	[Switch] $Recurse
  )
  
  Get-CommonPrefixes @psBoundParameters
}