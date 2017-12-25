#!/bin/bash
yum update -y
yum install httpd24 -y
service httpd start
chkconfig httpd on
echo "<html><body><h1>Hello, This is Prithiv (London Webserver 1)</h1></body></html>" > /var/www/html/index.html
