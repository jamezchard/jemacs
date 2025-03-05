Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize
Write-Output "$($screen.Width)x$($screen.Height)"
