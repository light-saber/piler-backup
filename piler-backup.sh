#!/bin/bash

#This script checks if the retention period of the mails archieved is over or not.
#If over, it will export all the mails and runs pilerpurge
#If its not over, it will simply increment the number of days remaining and wait
#This can be added as a cronjob and executed daily. 
#If you want to change the retention period, just edit the system variable RETENTION_PERIOD at /root/.bashrc

#Created by Sachin Acharya
#Yukthi Systems Pvt. Ltd.
#Date: 2014.06.12

source /root/.bashrc
cd /root/piler-0.1.25-rc2/
line=$(head -n 1 numberofdays)
if[ $RETENTION_PERIOD -eq $line ]
then
        cd /tmp/
        end=$(date '+%Y.%m.%d')
        begin=$(date --date="$RETENTION_PERIOD days ago" +"%Y.%m.%d")
        pilerexport -a $begin -b $end
        mkdir $begin.$end
        mv *.eml /tmp/$begin.$end/
        tar -cf $begin.$end.tar.gz $begin.$end
        mv $begin.$end.tar.gz /root/piler-0.1.25-rc2/backups/
        cd /root/piler-0.1.25-rc2/
        rm numberofdays
        echo 1 >> numberofdays
        pilerpurge
else
        line=$((line+1))
        rm numberofdays
        echo $line >> numberofdays
fi
