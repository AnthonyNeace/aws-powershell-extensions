# Get-IAMGroupMembership.ps1
# --------------------------------------------------------------------------------
# Get all IAM users of IAM groups on the account.
# 
# USAGE:
# Get all group membership:
# ./Get-GroupMembership.ps1
#
# USAGE:
# Get a single group's membership:
# ./Get-GroupMembership.ps1 -GroupName 'MyGroup'
#
# EXAMPLE OUTPUT:
# "myacct","admins","myuser1"
# "myacct","admins","myuser2"
# "myacct","users","myuser3"
# --------------------------------------------------------------------------------
[CmdletBinding()]
param
(
    [string]$GroupName
)

. ./lib.ps1

Get-IAMGroupMembership @psBoundParameters