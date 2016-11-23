Create an empty folder C:\Temp and copy the 2 DBs files. Create the SQL Server Container:
docker run -d -p 1433:1433 -v C:/temp/:C:/temp/ --env attach_dbs="[{'dbName':'Orchard','dbFiles':['C:\\Temp\\Orchard.mdf','C:\\Temp\\Orchard_log.ldf']}]" -e sa_password=Password31! -e ACCEPT_EULA=Y --name sqlserver microsoft/mssql-server-windows-express:latest 

docker run -d -p 80:80 --name orchard --link sqlserver:sqlserver flodu31/orchard-iis ping -t localhost
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" orchard
