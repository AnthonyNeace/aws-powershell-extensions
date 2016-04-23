# Get-InstanceByName.ps1
# --------------------------------------------------------------------------------
# Get the InstanceId, Value of the Tag where Key = 'Name', and Instance Object
#
# Documentation for Amazon.EC2.Model.Instance is here:
# http://docs.aws.amazon.com/sdkfornet/v3/apidocs/items/EC2/TEC2Instance.html
# 
# USAGE:
# Get InstanceId and TagName for all visible instances
# .\Get-InstanceByName.ps1
#
# Get InstanceId and TagName for a specific instance
# .\Get-InstanceByName.ps1 -Name "InstanceName"
#
# Get InstanceId, TagName, and Instance object for a specific instance
# .\Get-InstanceByName.ps1 -Name "InstanceName" -ExpandInstance
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
[CmdletBinding()]
param
(
  [string] $Name,
  [Switch] $ExpandInstance
)

. ./lib.ps1

Get-InstanceByName @psBoundParameters