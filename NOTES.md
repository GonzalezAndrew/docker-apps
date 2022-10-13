# NOTES

## CLI reference
List of helpful commands
```
# build all services
$ docker-compose build

# start all services in detached mode (run containers in backgroup, print new container name)
$ docker-compose up -d

# run commands in container
$ docker exec -it <container_name> sh 

# run jenkins image, with port, volumes and in detached mode
$ docker run -v "${PWD}/jenkins/jenkins_home:/var/jenkins_home" -d --name jenkins -p 8080:8080 andrewgonzo/jenkins:1.0.0

#shows all running containers
$ docker ps 

#stop container by id
$ docker stop <container-id>

# remove exisitng containers
$ docker-compose rm vault
```