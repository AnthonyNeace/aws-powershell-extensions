# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-InstanceByName
# --------------------------------------------------------------------------------

function Get-InstanceNames
{
  @(Get-EC2Instance).Instances | 
  Select InstanceId, 
  @{Name='TagName'; Expression={($_.Tag | ? { $_.Key -eq "Name" } | % { $_.Value } ) } }
}

function Get-ExpandedInstanceNames
{
  @(Get-EC2Instance).Instances | 
  Select InstanceId, 
  @{Name='TagName'; Expression={($_.Tag | ? { $_.Key -eq "Name" } | % { $_.Value } ) } }, 
  @{Name='Instance'; Expression={ $_ } }
}

# --------------------------------------------------------------------------------
# USAGE:
# Get InstanceId and TagName for all visible instances
# . ./lib.ps1
# Get-InstanceByName.ps1
#
# Get InstanceId and TagName for a specific instance
# . ./lib.ps1
# Get-InstanceByName.ps1 -Name "InstanceName"
#
# Get InstanceId, TagName, and Instance object for a specific instance
# . ./lib.ps1
# Get-InstanceByName.ps1 -Name "InstanceName" -ExpandInstance
#
# EXAMPLE OUTPUT: No Expansion (-ExpandInstance flag not set)
# InstanceId TagName
# ---------- -------
# i-aaaa1111 InstanceName
# i-bbbb2222 OtherInstanceName
#
# EXAMPLE OUTPUT: Expansion
# InstanceId TagName           Instance
# ---------- -------           --------
# i-aaaa1111 InstanceName      Amazon.EC2.Model.Instance
# i-bbbb2222 OtherInstanceName Amazon.EC2.Model.Instance
# --------------------------------------------------------------------------------
function Get-InstanceByName
{
  param
  (
    [string] $Name,
    [Switch] $ExpandInstance	
  )

  # If name param is null or empty, get names of all visible instances
  if($Name)
  {
    if($ExpandInstance)
	{
      Get-ExpandedInstanceNames | ? { $_.TagName -eq $Name }
	}
	else
	{
	  Get-InstanceNames | ? { $_.TagName -eq $Name }
	}
  }
  else
  {
    if($ExpandInstance)
	{
      Get-ExpandedInstanceNames
	}
	else
	{
	  Get-InstanceNames
	}
  }
}