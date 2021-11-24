all:
	sudo mkdir /home/${USER}/data
	sudo mkdir /home/${USER}/data/mariadb-data
	sudo mkdir /home/${USER}/data/wordpress-data
	sudo sed -i "s/localhost/${USER}.42.fr/" "/etc/hosts"
	sudo docker-compose -f ./srcs/docker-compose.yml build
	sudo docker-compose -f ./srcs/docker-compose.yml up -d
down:
	sudo docker-compose -f ./srcs/docker-compose.yml down
clean:
	sudo docker system prune -a -f --volumes
	sudo docker system prune -a -f
	sudo rm -rf /home/${USER}/data/
	sudo rm -rf /home/${USER}/data/mariadb-data/
	sudo rm -rf /home/${USER}/data/wordpress-data/
	#sudo docker volume prune -f
	sudo docker stop $$(sudo docker ps -qa)
	sudo docker rm -f $$(sudo docker ps -qa)
	#sudo docker rmi -f $$(sudo docker images -qa)
	#sudo docker volume rm $$(sudo docker volume ls -q)
	sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null
	sudo docker system prune -a --force
