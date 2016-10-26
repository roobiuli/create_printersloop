#!/bin/bash
##
#INTER PART
function probeppd {
	ssh ibmadmin@$H "ls /home/ibmadmin/$PPD"

	if [ $? -ne 0 ]
		then
		ls ppd/$PPD
		if [ $? -eq 0 ]
			then
				scp ppd/$PPD ibmadmin@$H:/home/ibmadmin
			else
				echo "$PPD file not found on remote host nor the PPD directory , Please add it in the ppd dir and try again"
				exit 1
			fi
		fi
}


# Asking for files from performer side

echo "Please provide NAME of PPD file located on the server or local (ppd dir if you uploaded there )"

read PPD

echo "Please provide Printer file instruction ( The file containing the ip-nameofprinter EX: 127.0.0.1-it_TunelessPrinter "

read FILE


# Looping in Printers required to be created 
for printer in 	`cat $FILE`
do

IP=`echo $printer | cut -d"-" -f1`
NAME=`echo $printer | cut -d"-" -f2`

###

#Engaging server side Phase 1 





for H in `cat hosts.txt`
do
	probeppd
	
HNAME=`ssh ibmadmin@$H "sudo hostname"`
echo "Going to install printer $NAME with the IP $IP  using PPD $PPD on $HNAME having the MNGT IP:$H"



     ssh ibmadmin@$H "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
     #ssh ibmadmin@10.177.33.160 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
     #ssh ibmadmin@10.177.33.161 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
     #ssh ibmadmin@10.177.33.170 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
	#			ssh ibmadmin@10.177.71.17 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
	#			ssh ibmadmin@10.177.71.31 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
#ssh ibmadmin@10.177.94.145 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
#ssh ibmadmin@10.177.94.151 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
#ssh ibmadmin@10.177.94.153 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
#ssh ibmadmin@10.177.94.154 "sudo /usr/sbin/lpadmin -p $NAME -E -v lpd://$IP -P $PPD"
done

done
