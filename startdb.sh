#!/bin/sh
colima start --arch x86_64 --memory 4
# Check that container exist"
if [ "$(docker ps -aqf name=21-full)" ]; then
	echo "Container named as '21-full' is exist. Running exist container..."
	echo "Database user: demo | password: demo"
	echo " "
	echo "Hostname: localhost"
	echo " "
	echo "PORT: 1521"
	echo " "
	echo "Service name: XEPDB1"
	echo " "
	echo " "
	echo "To connect with db in container:"
	echo "sqlplus demo/demo@//localhost/XEPDB1 or sqlplus system/SysPassword1@//localhost/XEPDB1"
	echo " "
	docker start 21-full
	docker exec -it 21-full sh
else
 	echo "Container named as '21-full' is not exist. Created new container..."
  	echo " "
	echo " "
	echo "type: sqlplus system/SysPassword1@//localhost/XEPDB1"
	echo "create user demo identified by demo quota unlimited on users;"
	echo "grant connect, resource to demo;"
	echo "https://oralytics.com/2021/10/01/oracle-21c-xe-database-and-docker-setup/"
	echo " "
	echo "Database user: demo | password: demo"
	echo " "
	echo "Hostname: localhost"
	echo " "
	echo "PORT: 1521"
	echo " "
	echo "Service name: XEPDB1"
	echo " "
  	docker run -d -p 1521:1521 -e ORACLE_PASSWORD=SysPassword1 -v oracle-volume:/opt/oracle/XE21CFULL/oradata --name 21-full gvenzl/oracle-xe:21-full
  	docker exec -it 21-full sh
fi

