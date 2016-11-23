On a Windows Server 2016 server where docker is installed, create an empty folder C:\Temp and copy the 2 DBs files. Create the SQL Server Container:

docker run -d -p 1433:1433 -v C:/temp/:C:/temp/ --env attach_dbs="[{'dbName':'Orchard','dbFiles':['C:\\Temp\\Orchard.mdf','C:\\Temp\\Orchard_log.ldf']}]" -e sa_password=Password31! -e ACCEPT_EULA=Y --name sqlserver microsoft/mssql-server-windows-express:latest 

Create the Orchard container:

docker run -d -p 80:80 --name orchard --link sqlserver:sqlserver flodu31/orchard-iis ping -t localhost

Get the IP address of your container:

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" orchard

Connect to this IP address with a browser.
Change the Datasource to SQL Express and provide this connection string:

Data Source=sqlserver;Initial Catalog=Orchard;User ID=sa;Password=Florentdu31!;

Save and see the result :)
