# TeSLA CE docker-compose test version

This repository provides a fast deploy of TeSLA CE system for evaluation and testing purposes. Do not intent to use it in production environment. Vault is started in dev mode and data will be lost when container is destroyed. 

## Instructions

1. Execute preinstall script (preinstall.sh) and get moodle information and FR provider information.
```
./preinstall.sh
```

2. Edit your local machine DNS the following entries:

| Domain  |  Address |
|---|---|
| lti.tesla-ce  | 127.0.0.1 |
| api.tesla-ce  | 127.0.0.1 |
| moodle.tesla-ce  | 127.0.0.1 |
| storage.tesla-ce  | 127.0.0.1 |
| tesla-ce  | 127.0.0.1 |

In Linux or Mac OS you need to edit /etc/hosts

In OS Windows you need to edit c:\Windows\System32\drivers\etc\hosts

## Observations:
If used domain (tesla-ce in the example) is not a valid domain, the generated certificates are self-signed. In order your browser accept them, first visit:
- https://api.tesla-ce
- https://moodle.tesla-ce
- https://lti.tesla-ce
- https://storage.tesla-ce

And accept the provided certificate.

## Start TeSLA CE environment:
```
# First of all start services.
docker-compose -f docker-compose.tesla_services.yml up -d

# Second start TeSLA Core
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d

# Third start Face Recognition provider 
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml up -d

# Fourth moodle
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml up -d
```

## Shutdown TeSLA CE environment:
```
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml -f docker-compose.tfr.yml stop
```


If you remove containers, remember to reconfigure.