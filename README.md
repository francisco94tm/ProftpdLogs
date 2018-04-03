# ProftpdLogs
Show ftpd logs using AngularJS
## Installation
1. Install proftpd and mysql module
```
sudo apt-get install proftpd-basic proftpd-mod-mysql
```
2. Run mysql in a terminal and copy/paste the content of the file **_database.sql_** into it.
3. Replace the file **_/etc/proftpd/sql.conf_** with the one included in this repository.
4. Edit the file  **_/etc/proftpd/proftpd.conf_** and add the next lines at the end of the file

```apache
Include               /etc/proftpd/sql.conf
RequireValidShell     off
```   
