docker run --name sqlserver -p 1433:1433 --env sa_password='Password123' -d microsoft/mssql-server-2014-express-windows

docker run --name mysql -p 3306:3306 -d microsoft/sample-mysql ping -t localhost

docker run -d -p 80:80 --name orchard --link mysql:mysql flodu31/orchard-iis ping -t localhost

docker exec -t -i orchard cmd.exe
