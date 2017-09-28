#!/bin/bash
# Author: Moacir Petry
# Date: 07/17/2013
# Version: 001
#-----------#
# Variables #
#-----------#

Start=`date`
End=`date`
mailbox=/mailbox/accounts/*
vmdk=/vmdk/vmwareMachine/*
vmdkMailServer=/vmdk/vmwareMachine/MailServer
vmdkWebServer=/vmdk/vmwareMachine/WebServer
vmdkFirewallServer=/vmdk/vmwareMachine/FirewallServer
vmdkDatabaseServer=/vmdk/vmwareMachine/DatabaseServer

vmdkMon=/var/hd3/Monday/vmdk
vmdkTue=/var/hd2/Tuesday/vmdk
vmdkWed=/var/hd3/Wednesday/vmdk
vmdkThu=/var/hd2/Thursday/vmdk
vmdkFri=/var/hd3/Friday/vmdk

mailboxMon=/var/hd3/Monday/mailbox
mailboxTue=/var/hd2/Tuesday/mailbox
mailboxWed=/var/hd3/Wednesday/mailbox
mailboxThu=/var/hd2/Thursday/mailbox
mailboxFri=/var/hd3/Friday/mailbox

mailboxMonDel=/var/hd3/Tuesday/mailbox/*
mailboxTueDel=/var/hd2/Tuesday/mailbox/*
mailboxWedDel=/var/hd3/Wednesday/mailbox/*
mailboxThuDel=/var/hd2/Thursday/mailbox/*
mailboxFriDel=/var/hd3/Friday/mailbox/*

vmdkMonDel=/var/hd3/Tuesday/vmdk/*
vmdkTueDel=/var/hd2/Tuesday/vmdk/*
vmdkWedDel=/var/hd3/Wednesday/vmdk/*
vmdkThuDel=/var/hd2/Thursday/vmdk/*
vmdkFriDel=/var/hd3/Friday/vmdk/*

info=/root/logs/info.log
dweek=`date +%w`
Mon=1
Tue=2
Wed=3
Thu=4
Fri=5
totalaccounts=`ls $mailbox | wc -l`

#------------------------------------------------#
# Check the day of week 0-6 and run the commands #
#------------------------------------------------#

#--------#
# Monday #
#--------#

if [ $Mon -eq $dweek ] 
	then
		echo -e "\nStart: $Start" > $info
		echo "" >> $info
		rm -rf $mailboxMonDel
		rm -rf $vmdkMonDel
		cp -av $vmdk $vmdkMon >> $info
		echo "" >> $info
		cp -av $mailbox $mailboxMon >> $info
		echo "" >> $info
		echo -e "\nTotal of accounts: $totalaccounts" >> $info
		echo -e "\nEnd: `date`" >> $info
		`cat /root/logs/info.log | /usr/sbin/sendmail mymail@domain.com`

#---------#
# Tuesday #
#---------#

elif [ $Tue -eq $dweek ]
	then
		echo -e "\nStart: $Start" > $info
		echo "" >> $info
		rm -rf $mailboxTueDel
		rm -rf $vmdkTueDel
		cp -av $vmdk $vmdkTue >> $info
		echo "" >> $info
		cp -av $mailbox $mailboxTue >> $info
		echo "" >> $info
		echo -e "\nTotal of accounts: $totalaccounts" >> $info
		echo -e "\nEnd: `date`" >> $info
		`cat /root/logs/info.log | /usr/sbin/sendmail mymail@domain.com`

#-----------#
# Wednesday #	
#-----------#

elif [ $Wed -eq $dweek ]
	then
		echo -e "\nStart: $Start" > $info
		echo "" >> $info
		rm -rf $mailboxWedDel
		rm -rf $vmdkWedDel
		cp -av $vmdk $vmdkWed >> $info
		echo "" >> $info
		cp -av $mailbox $mailboxWed >> $info
		echo "" >> $info
		echo -e "\nTotal of accounts: $totalaccounts" >> $info
		echo -e "\nEnd: `date`" >> $info
		`cat /root/logs/info.log | /usr/sbin/sendmail mymail@domain.com`
#----------#
# Thursday #	
#----------#

elif [ $Thu -eq $dweek ]
	then
		echo -e "\nStart: $Start" > $info
		echo "" >> $info
		rm -rf $mailboxThuDel
		rm -rf $vmdkThuDel
		cp -av $vmdk $vmdkThu >> $info
		echo "" >> $info
		cp -av $mailbox $mailboxThu >> $info
		echo "" >> $info
		echo -e "\nTotal of accounts: $totalaccounts" >> $info
		echo -e "\nEnd: `date`" >> $info
		`cat /root/logs/info.log | /usr/sbin/sendmail mymail@domain.com`

#--------#
# Friday #	
#--------#

elif [ $Fri -eq $dweek ]
	then
		echo -e "\nStart: $Start" > $info
		echo "" >> $info
		rm -rf $mailboxFriDel
		rm -rf $vmdkFriDel
		cp -av $vmdkMailServer $vmdkFri >> $info
		echo "" >> $info
		cp -av $vmdkWebServer $vmdkFri >> $info
		echo "" >> $info
		cp -av $vmdkFirewallServer $vmdkFri >> $info
		echo "" >> $info
		cp -av $vmdkDatabaseServer $vmdkFri >> $info
		echo "" >> $info
		cp -av $mailbox $mailboxFri >> $info
		echo "" >> $info
		echo -e "\nTotal of accounts: $totalaccounts" >> $info
		echo -e "\nEnd: `date`" >> $info
		`cat /root/logs/info.log | /usr/sbin/sendmail mymail@domain.com`
fi