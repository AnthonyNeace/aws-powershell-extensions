# Get-S3BucketCommonPrefixes.ps1
# --------------------------------------------------------------------------------
# Get all virtual directories/folders (called "Common Prefixes") in a bucket 
# 
# USAGE:
# Get all top-level directories:
# ./Get-S3BucketCommonPrefixes.ps1 -BucketName 'myBucket'
#
# Get all directories recursively:
# ./Get-S3BucketCommonPrefixes.ps1 -BucketName 'myBucket' -Recurse
#
# EXAMPLE OUTPUT:
# myprefix/
# myprefix/txt/
# myprefix/img/
# myotherprefix/
# ...
# --------------------------------------------------------------------------------
[CmdletBinding()]
param
(
  [Parameter(Mandatory=$true)][string] $BucketName,
  [Switch] $Recurse
)

. ./lib.ps1

Get-S3BucketCommonPrefixes @psBoundParameters