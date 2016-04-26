# Get-EC2SnapshotByVolumeId.ps1
# --------------------------------------------------------------------------------
# Get an EC2 Snapshot by a volume's ID
# 
# USAGE:
# . ./lib.ps1
# Get-EC2SnapshotByVolumeId.ps1 -VolumeId 'vol-11112222'
#
# EXAMPLE OUTPUT:
# Output is passed through from Get-EC2Snapshot, see here for full output:
# http://docs.aws.amazon.com/powershell/latest/reference/items/Get-EC2Snapshot.html
# --------------------------------------------------------------------------------
[CmdletBinding()]
  param
  (
	[Parameter(Mandatory=$true)][string]$VolumeId
  )

. ./lib.ps1

Get-EC2SnapshotByVolumeId @psBoundParameters