# Confirm-AWSRegion.ps1
# --------------------------------------------------------------------------------
# Check if an input string matches the current list of valid AWS Regions
# List of valid regions is found via AWS Tools for PowerShell cmdlet 
# 'Get-AWSRegion' Link:
# http://docs.aws.amazon.com/powershell/latest/reference/items/Get-AWSRegion.html
# 
# USAGE:
# Return True:
# . ./lib.ps1
# Confirm-AWSRegion -Region 'us-east-1'
#
# Return False:
# . ./lib.ps1
# Confirm-AWSRegion -Region 'us-east-banana'
#
# EXAMPLE OUTPUT:
# Boolean true/false, depending on success
# --------------------------------------------------------------------------------
[CmdletBinding()]
param
(
  [Parameter(Mandatory=$true)][string]$Region
)

. ./lib.ps1

Confirm-AWSRegion @psBoundParameters