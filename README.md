Mail Piler auto backup 
============

Mail Piler is an Open Source Email Archival software (www.mailpiler.org) and it is used to archive emails as and when they are either sent or received at a mail server. 

But there are times when we want to customize the mail archival. This script does one sucj job.

The job:
======

Import all the mails from the archive and store it in a compressed file. This must be done once every given number of days, after which all the backup must be deleted from the archive. 

This script imports all the mails and then saves it in the tar file named end-date.start-date.tar.gz

Prereqs:
=======

1. Set the retention_period in piler.conf to 1.
2. Create a file "numberofdays" and in that file, store the value 1.
3. Create a directore "backup" in your root folder where Piler installation file was untarred.
4. /tmp must have piler:piler as its owner.
5. Edit .bashrc and add the following: RETENTION_PERIOD=x (where x is the number of days after which you want a backup) 

How to use this script:
============

1. Save this file in /etc/cron.d
2. vim /etc/crontab
3. Add the following: 59 23  * * *  root /etc/cron.d/piler-backup.sh
4. chmod +x /etc/cron.d/piler-backup.sh
5. DONE!

