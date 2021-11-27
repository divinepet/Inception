# About The Project
![screenshot](https://mchost.ru/files/img/article4st.png)

This project aimed to install Wordpress, MariaDB and Nginx to a different Docker containers and connect them together with a different ports

# Getting started
## Prerequisites
This project should be done on a VM. I used a debian 11
## Installation ⚙️
1. Clone the repo
```
git clone https://github.com/divinepet/irc_server
```
2. Compile the project
```
make
```
# Usage
If everything compiled good and makefile had no errors, you can go to elaronda.42.fr and see the Wordpress start page
# Step-by-step compliting
1. Makefile contains: creating a folders for our volumes: Wordpress and MariaDB, changing localhost to my own domen and build/launch docker-compose.</br>
Commented lines in clean-rule allows you make your build too faster after you changed something in a project, using cache.
2. Docker-compose.yml split on three parts: volumes, services and network.
3. Enviroments in .env needs to hide private data from configuration files
4. In the Wordpress we are using a wordpress-cli for pre-install service before it will be launched. So after build we have an installed Wordpress
5. Nginx using a TSL v1.2 and 1.3 cryptographic protocols. It appear in default config-file
6. MariaDB creates a table and gets an admin-privileges to only one user with a password. So any different user can't get access to the DB
