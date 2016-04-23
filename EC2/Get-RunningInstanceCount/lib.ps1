# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-RunningInstanceCount 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# . ./lib.ps1
# Get-RunningInstanceCount
# --------------------------------------------------------------------------------
function Get-RunningInstanceCount
{
    $filterRunning = New-Object Amazon.EC2.Model.Filter -Property @{Name = "instance-state-name"; Value = "running"}

    @(Get-EC2Instance -Filter $filterRunning).Count
}