https://hub.daocloud.io/repos/fa51c1d6-9dc2-49d9-91ac-4bbfc24a1bda

docker pull daocloud.io/library/mysql:5.7.4

docker run --name sugar-mysql -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -d daocloud.io/mysql:5.7.4