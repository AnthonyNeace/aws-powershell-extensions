# Get-HoursSinceBoot.ps1
# --------------------------------------------------------------------------------
# Get data about lifetime of instances
# 
# USAGE:
# ./Get-HoursSinceBoot.ps1
#
# EXAMPLE OUTPUT:
# InstanceId LaunchTime            HoursSinceBoot
# ---------- ----------            --------------
# i-aaaa1111 4/19/2016 10:19:30 AM 82.8319531602778
# --------------------------------------------------------------------------------

. ./lib.ps1

Get-HoursSinceBoot