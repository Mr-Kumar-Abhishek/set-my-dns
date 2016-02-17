#!/bin/bash
write_to_file(){
	local file="/etc/resolv.conf"
	
	while true; do 
		DNS_SERVER1="nameserver 208.67.222.222" #new dns
		DNS_SERVER2="nameserver 208.67.220.220" #new dns 
		if [ ! -f "$file" ]; then
			touch "$file"
		else
			if  grep "192.168.43.1\|192.168.42.129" $file
			 then
				rm "$file"
				touch "$file"

				echo "$DNS_SERVER1" > "$file";
				echo "$DNS_SERVER2" >> "$file";
			fi
		fi
		sleep 1
	done
}

write_to_file
