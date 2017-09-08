# Lab 1: Artifacts Script
# This script grabs many artifacts from a machine including
# Time, Uptime, Operating System Info, Network Info, and Software

# This script is missing features due to them not being corrected
# prior to the deadline

"Timezone: " + (Get-TimeZone)
$date = (Get-Date)
"Date/Time: " + $date
$uptime = Get-WmiObject -Class win32_operatingsystem
$uptime = $uptime.ConvertToDateTime($uptime.LastBootUpTime)
"Uptime: " + (new-timespan -start $uptime -end $date)
[System.Environment]::OSVersion.Version
"`n"
"OS Version: " + ((Get-WmiObject -class Win32_OperatingSystem).Caption)
"CPU Brand: " + (Get-WmiObject win32_processor).Manufacturer
"CPU Type: " + (Get-WmiObject win32_processor).Name
$mem = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory
$mem = [Math]::Round($mem/1024MB)
"RAM: " + $mem + "GB"
Get-PSDrive -PSProvider FileSystem
"Hostname: " + (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
Get-WmiObject -Class Win32_UserAccount | Format-Table
Get-Service |select -property name,starttype | Format-Table
Get-ScheduledTask
arp -a
ipconfig /all
netstat -a
Get-WmiObject -Class Win32_Product | Format-Table
Get-Process
#Export-Csv C:\scriptresult.txt