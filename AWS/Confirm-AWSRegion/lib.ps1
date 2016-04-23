# --------------------------------------------------------------------------------
# USAGE:
# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Confirm-AWSRegion 
# --------------------------------------------------------------------------------

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
function Confirm-AWSRegion
{
  [CmdletBinding()]
  param
  (
	[Parameter(Mandatory=$true)][string]$Region
  )
  
  $result = Get-AWSRegion | ? { $_.Region -eq $Region }
  
  if($result -ne $null)
  {
    $true
  }
  else
  {
    $regions = Get-AWSRegion | % { "$($_.Region)"}
    $regionString = ([string]::Join("`r`n", $regions))    
  
    Write-Host -BackgroundColor "Black" -ForegroundColor "Red" "'$Region' does not match a valid region string. Valid region strings:`r`n$regionString"
	
	$false
  }
}