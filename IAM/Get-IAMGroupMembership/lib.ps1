# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-IAMGroupMembership 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# Get all IAM users of IAM groups on the account.
# 
# USAGE:
# Get all group membership:
# . ./lib.ps1
# Get-IAMGroupMembership
#
# USAGE:
# Get a single group's membership:
# . ./lib.ps1
# Get-IAMGroupMembership -GroupName 'MyGroup'
#
# EXAMPLE OUTPUT:
# "myacct","admins","myuser1"
# "myacct","admins","myuser2"
# "myacct","users","myuser3"
# --------------------------------------------------------------------------------

function Get-IAMGroupMembership()
{
  [CmdletBinding()]
  param
  (
    [string]$GroupName = ""
  ) 
  $alias = Get-IAMAccountAlias

  $groups = if([string]::IsNullOrWhitespace($GroupName)) { @(Get-IAMGroups).GroupName } else { $GroupName }

  $groups | % { 
    $group = $_;
    (Get-IAMGroup -groupname $_).Users | % { 
      [pscustomobject]@{ 
        Alias = $alias; 
        GroupName = $group; 
        UserName = $_.UserName
      } 
    }
  }
}