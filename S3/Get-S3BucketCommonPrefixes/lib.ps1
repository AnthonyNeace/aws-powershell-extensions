# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-S3BucketCommonPrefixes 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# Get all top-level directories:
# . ./lib.ps1
# Get-S3BucketCommonPrefixes -BucketName 'myBucket' -KeyPrefix '/'
#
# Get all directories recursively:
# . ./lib.ps1
# Get-S3BucketCommonPrefixes -BucketName 'myBucket' -KeyPrefix '/' -Recurse $true
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
    [string] $BucketName,
    [string] $KeyPrefix,
    [bool] $Recurse
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
# Get-S3BucketCommonPrefixes -BucketName 'myBucket'
#
# Get all directories recursively:
# . ./lib.ps1
# Get-S3BucketCommonPrefixes -BucketName 'myBucket' -Recurse $true
#
# EXAMPLE OUTPUT:
# myprefix/
# myprefix/txt/
# myprefix/img/
# myotherprefix/
# ...
# --------------------------------------------------------------------------------
function Get-S3BucketCommonPrefixes
{
  param
  (
    [string] $BucketName,
	[bool] $Recurse = $false
  )
  
  Get-CommonPrefixes -BucketName $BucketName -KeyPrefix '/' -Recurse $Recurse
}