# Ports used for communication

| Component | To | Port |
| :--- | :--- | :--- |
| api-core | Backup engine \(IBM Spectrum Protect\) | 1500\*\* |
| api-core | MySQL database | 3306\* |
| api-core | RabbitMQ | 5672\* |
| KODO4Cloud Agent | api-core | 443 |
| KODO4Cloud Agent | Microsoft Office365 | 443, 80 |
| KODO4Cloud Agent | RabbitMQ | 5672\* |

_\* - default port number  
\*\* - default port number for client and administrative communication_

