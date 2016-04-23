# lib.ps1
# --------------------------------------------------------------------------------
# Library of methods related to Get-HoursSinceBoot 
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# USAGE:
# . ./lib.ps1
# Get-HoursSinceBoot.ps1
#
# EXAMPLE OUTPUT:
# InstanceId LaunchTime            HoursSinceBoot
# ---------- ----------            --------------
# i-aaaa1111 4/19/2016 10:19:30 AM 82.8319531602778
# --------------------------------------------------------------------------------
function Get-HoursSinceBoot
{
  Get-EC2Instance | 
  % { $_.RunningInstance } | 
  Select-Object InstanceId, LaunchTime, @{Name='HoursSinceBoot'; Expression={ ((Get-Date)-$_.LaunchTime).TotalHours } }
}