# farmerzon
main-repo

# Docker-compose config
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
