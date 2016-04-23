# Get-S3ObjectCount.ps1
# --------------------------------------------------------------------------------
# Counts all objects matching the specified bucket and/or keyprefix
#
# USAGE:
# Get all top-level directories:
# ./Get-S3ObjectCount.ps1 -BucketName 'myBucket'
#
# Get all directories recursively:
# ./Get-S3ObjectCount.ps1 -BucketName 'myBucket' -KeyPrefix 'myFolder'
#
# EXAMPLE OUTPUT:
# 10
# --------------------------------------------------------------------------------
[CmdletBinding()]
param
(
  [Parameter(Mandatory=$true)][string] $BucketName,
  [string] $KeyPrefix
)

. ./lib.ps1

Get-S3ObjectCount @psBoundParameters