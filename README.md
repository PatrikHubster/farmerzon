# farmerzon
main-repo

# Docker-compose config
Configuration:
| Service        | containername              | Adress on host (localhost)            | Adress avail. inside          |
| --             | --                         | --                                    | ---                           |
| authentication | farmerzon\_auth            | :5000                                 | authentication:5000           |
| articles       | farmerzon\_articles        | :5002                                 | articles:5000                 |
| frontend       | farmerzon\_frontend        | :3000                                 | frontend:3000                 |
| nginx          | farmerzon\_nginx           | :8080                                 | nginx:80                      |
| rabbitmq       | farmerzon\_rabbitmq        | :5672 (server) :15672 (admin console) | rabbitmq:5672, rabbitmq:15672 |
| auth\_db       | farmerzon\_auth\_db        | :5432                                 | auth\_db:5432                 |
| order\_db      | farmerzon\_order\_db       | :5431                                 | order\_db:5432                |
| articles\_db   | farmerzon\_articles\_db    | :5430                                 | articles\_db:5432             |
| worker_1       | farmerzon\_order\_worker_1 | -                                     | -                             |
| worker_2       | farmerzon\_order\_worker_2 | -                                     | -                             |
| worker_3       | farmerzon\_order\_worker_3 | -                                     | -                             |
| worker_4       | farmerzon\_order\_worker_4 | -                                     | -                             |

