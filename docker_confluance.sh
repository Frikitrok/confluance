docker run --name mysqldb -e MYSQL_USER=confluence -e MYSQL_PASSWORD=confluence -e MYSQL_DATABASE=confluence -e MYSQL_ROOT_PASSWORD=supersecret -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -d mysql

cp /vagrant/Dockerfile .
docker build -t confluence	.
docker run --rm --name confluence-machine -d -p 8080:8090 -v /var/lib/mysql:/var/lib/mysql confluence