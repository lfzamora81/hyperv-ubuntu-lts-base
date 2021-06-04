Convert-VHD -VHDType Dynamic -Path .\livecd.ubuntu-cpc.azure.vhd -DestinationPath .\livecd.ubuntu-cpc.azure.vhdx
Optimize-VHD livecd.ubuntu-cpc.azure.vhdx -Mode Full
