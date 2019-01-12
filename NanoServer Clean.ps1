####Build Nano Server##########
New-NanoServerImage -MediaPath $path -Edition 'Datacenter' -DeploymentType Guest -TargetPath $logpath
###################################


#Connect to Nano Server and Deploy Site

$ip = "192.168.0.125"  # replace with your Nano Server's IP address
$s = New-PSSession -ComputerName $ip -Credential ~\Administrator
Copy-Item -ToSession $s -Path $site -Recurse -Destination C:\Web2
Copy-Item -FromSession $s -Path c:\web1\* -Destination C:\Nano
New-IISSite -Name site -PhysicalPath c:\web2\Gym -BindingInformation "*:80:" -Force
