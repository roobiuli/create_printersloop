Cups Printer loop install

Purpose : Client demands multiple printers to be installed on SAP systems which means multiple nodes The script is primitive however it achieve the goals

How to use

you will need the “script.sh” in a directory in same dir you will need a file named “hosts.txt” In the hosts.txt file put the nodes management ips where you need to install the printers (one per line) in the same directory you will need another dir created named “ppd” - In the ppd dir put all your ppd files ex: Lexamark_whavermnodel_whaver.ppd In the same Dir you will need a custom file named “whateveryouwant” - in this file you will need to define the printers ips and names that will need to be installed on the nodes/hosts the format needed is ip followed by “-” and then the printer name ( one per line ) EX: 192.168.0.2-printer_name

Execution : ./script.sh it will ask you for a ppd file on the serverside ( if you don`t know if there is one placed there simply give the name of the ppd file you`ve placed in the ppd dir [localy]) the ppd file must be the one needed for the printer model you want to install

Second question it will ask you for the custom named file where you`ve set the printer ips and names

After that the script will connect to the servers ips defined in hosts.txt and use cups commands to exec the creation of of the printers defined in the custom named file and use the PPD file you`ve told it to use

How the script dir should look:

robert@amnesia create_printersloop]$ ll
total 16
-rw-rw-r--. 1 robert robert  124 Oct 26 12:46 hosts.txt
drwxrwxr-x. 2 robert robert 4096 Oct 26 12:43 ppd
-rwxrwxr-x. 1 robert robert 1898 Oct 24 18:02 script.sh
-rw-rw-r--. 1 robert robert   26 Oct 26 12:48 xer 
