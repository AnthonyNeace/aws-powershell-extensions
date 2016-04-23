# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-SNSTopicByName 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# . ./lib.ps1
# Get-AWSAccountId
# --------------------------------------------------------------------------------
function Get-AWSAccountId
{
  @(get-ec2securitygroup -GroupNames "default")[0].OwnerId
}

# --------------------------------------------------------------------------------
# USAGE:
# Default to the current stored profile's region and account number:
# . ./lib.ps1
# Get-SNSTopicByName.ps1 -TopicName 'MyTopicName'
#
# Pass an explicit region and account number:
# . ./lib.ps1
# Get-SNSTopicByName.ps1 -TopicName 'MyTopicName' -Region 'us-east-1' -AWSAccountNumber '123456789123'
#
# EXAMPLE OUTPUT:
# Output is passed through from Get-SNSTopicAttribute, see here for full output:
# http://docs.aws.amazon.com/powershell/latest/reference/items/Get-SNSTopicAttribute.html
# --------------------------------------------------------------------------------
function Get-SNSTopicByName
{
  [CmdletBinding()]
  param
  (
    # Default to stored aws region if it exists
	[string]$Region = $StoredAWSRegion,
	# Default to stored profile's account's id
	[string]$AWSAccountNumber = (Get-AWSAccountId),
	[Parameter(Mandatory=$true)][string]$TopicName
  )

  $topicArn = "arn:aws:sns:$($Region):$($AWSAccountNumber):$($TopicName)"

  Get-SNSTopicAttribute -TopicArn $topicArn
}