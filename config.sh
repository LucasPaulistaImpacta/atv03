# REMOVE ALL CONTAINERS
docker rm -f $(docker ps -q)

# CREATE CONTAINERS MYSQL AND NGINX
docker-compose up -d

sleep 5

#  ASSIGN IP NGNIX CONTAINER
IP_NGINX_CONTAINER=http://$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' at03-nginx)
echo "\nIP NGNIX CONTAINER: $IP_NGINX_CONTAINER"

# HEALTH CHECK NGINX CONTAINER
echo "\n\nHEALTH CHECK NGINX CONTAINER"
docker ps -f status=running -f name=at03-nginx

# HEALTH CHECK NGINX CONTAINER
echo "\n\nHEALTH CHECK NGINX CONTAINER PORT 80"
curl --url "http://localhost" | grep nginx.com

# CURL REMOTE FROM CONTAINER NGINX TO CONTAINER MYSQL
echo "\n\nCURL REMOTE FROM CONTAINER NGINX TO CONTAINER MYSQL"
docker exec -it at03-nginx mysql -uroot -admi@123! -at03-data