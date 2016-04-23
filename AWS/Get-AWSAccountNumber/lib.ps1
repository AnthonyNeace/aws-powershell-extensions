# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-AWSAccountNumber 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# . ./lib.ps1
# Get-AWSAccountNumber
#
# EXAMPLE OUTPUT:
# 111122223333
# --------------------------------------------------------------------------------
function Get-AWSAccountNumber
{
  @(get-ec2securitygroup -GroupNames "default")[0].OwnerId
}