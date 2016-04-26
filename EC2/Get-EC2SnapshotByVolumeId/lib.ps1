# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-EC2SnapshotByVolumeId 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# . ./lib.ps1
# Get-EC2SnapshotByVolumeId.ps1 -VolumeId 'vol-11112222'
#
# EXAMPLE OUTPUT:
# Output is passed through from Get-EC2Snapshot, see here for full output:
# http://docs.aws.amazon.com/powershell/latest/reference/items/Get-EC2Snapshot.html
# --------------------------------------------------------------------------------
function Get-EC2SnapshotByVolumeId
{
  [CmdletBinding()]
  param
  (
	[Parameter(Mandatory=$true)][string]$VolumeId
  )
  # Create a filter to limit by specific volume ID
  $filterByVolumeId = New-Object Amazon.EC2.Model.Filter -Property @{Name = "volume-id"; Value = "$VolumeId"}

  # Describe the collection of snapshots
  Get-EC2Snapshot -OwnerIds self -Filter $filterByVolumeId
}