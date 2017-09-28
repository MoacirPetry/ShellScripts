#!/bin/bash
# Author: Moacir Petry
# Data Communication - Ethernet Frame Analyser
# Version: 009
# Data: 12/02/2013
#
# Variables
cap="/root/arq/cap.pcap"
arq="/root/arq/arq.txt"
arq2="/root/arq/arq2.txt"
arq3="/root/arq/arq3.txt"
src="/root/arq/src.txt"
dst="/root/arq/dst.txt"
index="/root/arq/index.html"
pad="/root/arq/pad.txt"
pad2="/root/arq/pad2.txt"
pad3="/root/arq/pad3.txt"
A=26
F=0

generatePcap(){
	/usr/sbin/tcpdump -i eth0 -etn -s 0 -c 1 -w $cap
}
readPcap(){
	/usr/sbin/tcpdump -entA -r $cap > $arq
}

manipulationPcap(){
	/bin/sed 's/ /\n/g' $arq > $arq2 #change line to \n - break
	/bin/sed '/>/d' $arq2 > $arq3 #remove line that contains >
	/usr/bin/cut -c1-17 $arq3 | /usr/bin/head -1 > $src #get source mac address
	/usr/bin/cut -c1-17 $arq3 | /bin/sed -n -e 2p > $dst #get destination mac address
}

runProcess(){
	generatePcap
	readPcap
	manipulationPcap	
	computePAD
}

computePAD(){
	/usr/bin/head -1 $arq > $pad
	/bin/sed 's/ /\n/g' $pad > $pad2
	C=`/usr/bin/tail -1 $pad2` 
	P=$(( $A + $C ));
	if [ $P -lt 65 ]; then
	F=$(( 64 - $P ));
	echo $F > $pad3
	else
	echo "0" > $pad3
	fi	
}

sendData(){
	echo "
<tr>
<td>"`/bin/cat $dst`"</td>
<td>"`/bin/cat $src`"</td>
<td>"`/bin/sed -n -e 5p $arq3 | /bin/sed 's/)//g' | /bin/sed 's/(//g' | /bin/sed 's/,//g'`"</td>
<td>"`/bin/sed '1d' $arq`"</td>
<td>"`/bin/cat $pad3`"</td>
</tr>
"	
}

repeat(){
y=0
while [ $y -lt 100 ]
do
	runProcess
	sendData
	y=$((y+1))
done
}
generateHTML(){
	echo "
<html>
<head>
<title>Parse .pcap</title>
</head>
<body>
<table border='1'>
<tr>
<th>dst</th>
<th>src</th>
<th>length</th>
<th>data</th>
<th>pad</th>
</tr>
"`runProcess`"
 "`
sendData
`"
 "`repeat`"
</table>
</body>
</html>
" > $index
}

generateHTML	#function that start all process and to create the html with all results