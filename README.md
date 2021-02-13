# farmerzon

This repository is used to store all the configurations for farmerzon. Here all files for hosting, deployment, docker composing and so on are stored.

# docker-compose description

In the repository we have differnt `docker-compose` files. To start a specific `docker-compose` file you have to use the following command:

```console
user@computer:~$ docker-compose -f <file-name> build && docker-compose -f <file-anme> up
```

In some Windows, Linux and macOS setups it is as well necessary to do this with administrator privileges. So if the command above doesn't work try the one below:

```console
user@computer:~$ sudo docker-compose -f <file-name> build && sudo docker-compose -f <file-name> up
```

In the repository there are different `docker-compose` files. We have the following ones:

1. `deplyoment-windows.yml`
2. `deployment-unix.yml`
3. `virtual-databases-unix.yml`
4. `virtual-databases-windows.yml`

Between Windows and Unix there are some huge differences in how to use Docker volumes. Currently the Windows version does not include volumes to store the database for more than one deployment but you can try to solve this issue with the [description how to use volumes in Windows](https://forums.docker.com/t/data-directory-var-lib-postgresql-data-pgdata-has-wrong-ownership/17963/31).

The deployments are for deploying all microservice together. The unix version stores the databases in files therefor you need the `delete-databases.sh` script. The `virtual-databases-unix.yml` deploys only the databases for local testing during the development.

To tear down the deployed containers use the following command:

```console
user@computer:~$ docker-compose -f <file-name> down
```

After this section it is clear that for example the deployment under macOS looks like the following:

```console
user@computer:~$ docker-compose -f deployment-unix build && docker-compose -f deployment-unix up
user@computer:~$ docker-compose -f deployment-unix down
```

Under Windows make sure to use the WSL extension in Docker. Use the described commands in a WSL window.

# docker-compose whole deployment

Configuration:
| Service | Adress on host (localhost) | Adress available inside |
| - | - | - |
| farmerzon-authentication | http://localhost:5000 | farmerzon-authentication:5000 |
| farmerzon-articles | http://localhost:5001 | farmerzon-articles:5000 |
| farmerzon-address | http://localhost:5002 | farmerzon-address:5000 | 
| farmerzon-authentication-db | http://localhost:5432 | farmerzon-authentication-db:5432 |
| farmerzon-articles-db | http://localhost:5433 | farmerzon-articles-db:5432 |
| farmerzon-address-db | http://localhost:5434 | farmerzon-address-db:5432 |
| farmerzon-recipies-db | http://localhost:5435 | farmerzon-recipies-db:5432 |
| placement | http://localhost:50006 | placement:500006 |
| redis | http://localhost:6380 | redis:6379 |

# farmerzon hetzner installation

First step is to install docker. Therfor follow [the instructions](https://docs.docker.com/engine/install/ubuntu/) linked here. In the next step install `docker-compose` with `sudo apt install docker-compose`. Use the yml descriptor from this repository in the folder `./docker/deployment-production.yml`. Start this with the command `docker-compose -f deployment-production.yml up`. The [descriptor only exports ports locally](https://www.jeffgeerling.com/blog/2020/be-careful-docker-might-be-exposing-ports-world) with the prefix `127.0.0.1` so that these services are exposed locally and not from the internet.

Ngnix is installed locally to use it in combination with [certbot](https://certbot.eff.org). The [instruction](https://certbot.eff.org/lets-encrypt/ubuntufocal-nginx) is linked here as well. The nginx configuratio is located under `/etc/nginx/sites-enabled`. This one has to be configured like shown below:

```conf
server {
	listen 80;
	server_name farmerzon.net;
	location / {
		proxy_pass http://localhost:3000;
	}

}

server {
    listen 80;
    server_name api.authentication.farmerzon.net;
    location / {
        proxy_pass http://localhost:5000;
    }
}

server {
    listen 80;
    server_name api.backend.farmerzon.net;
    location / {
            proxy_pass http://localhost:5003;
    }
}
```

With the command from the cerbot instruction `sudo certbot --nginx` you can transform them to `https` with a automatic refreshing certificate.

# farmerzon interface testing

In this repository you have a request folder included. Often it is easier to use [Postman](https://www.postman.com) because you can prepare statements to execute. If you want to test with Postman use the included `request.json` to import it in Postman and run the included requests. 