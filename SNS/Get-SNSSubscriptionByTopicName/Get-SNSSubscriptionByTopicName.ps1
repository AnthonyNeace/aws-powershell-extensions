# Get-SNSTopicByName.ps1
# --------------------------------------------------------------------------------
# Get an SNS topic's details by the topic name
# 
# USAGE:
# Default to the current stored profile's region and account number:
# ./Get-SNSSubscriptionByTopicName.ps1 -TopicName 'MyTopicName'
#
# Pass an explicit region and account number:
# ./Get-SNSSubscriptionByTopicName.ps1 -TopicName 'MyTopicName' -Region 'us-east-1' -AWSAccountNumber '123456789123'
#
# EXAMPLE OUTPUT:
# Output is passed through from Get-SNSTopicAttribute, see here for full output:
# http://docs.aws.amazon.com/powershell/latest/reference/items/Get-SNSSubscriptionByTopic.html
# --------------------------------------------------------------------------------
[CmdletBinding()]
param
(
  [string]$Region,
  [string]$AWSAccountNumber,
  [Parameter(Mandatory=$true)][string]$TopicName
)

. ./lib.ps1

Get-SNSSubscriptionByTopicName @psBoundParameters