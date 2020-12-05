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

Under Windows make sure to use the 

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

# farmerzon interface testing

In this repository you have a request folder included. Often it is easier to use [Postman]() because you can prepare statements to execute. If you want to test with Postman use the included `request.json` to import it in Postman and run the included requests. 