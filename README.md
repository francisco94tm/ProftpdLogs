# ProftpdLogs
Show proftpd logs using AngularJS
## Requisites
- MySQL
- PHP
- HTTP Apache or another HTTP server
- Ubuntu
## Installation
1. Put the *ProftpdLogs* repository folder into your HTTP server project folder, */var/www/html* if you are using HTTP Apache.
2. Install proftpd and mysql module
```
sudo apt-get install proftpd-basic proftpd-mod-mysql
```
3. Run mysql in a terminal and copy/paste the content of the file **_database.sql_** into it.
4. Replace the file **_/etc/proftpd/sql.conf_** with the one included in this repository.
5. Edit the file  **_/etc/proftpd/proftpd.conf_** and add the next lines at the end of the file

```
Include               /etc/proftpd/sql.conf
RequireValidShell     off
```   
6. Restart proftpd and Apache server
```
sudo systemctl restart proftpd
sudo systemctl restart apache2

7. Open a web browser and go to http://localhost/ProftpdLogs and that's it :-P
