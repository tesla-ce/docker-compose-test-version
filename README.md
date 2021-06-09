# TeSLA CE docker-compose test version

## Instructions

1. Execute preinstall script (preinstall.sh) and get moodle information and FR provider information.
```
./preinstall.sh
```

2. Edit .env_moodle the role_id and secret_id variables with correct values from step 1.

3. Edit .env_tfr the role_id and secret_id variables with correct values from step 1.

4. Edit your local machine DNS the following entries:

| Domain  |  Address |
|---|---|
| lti.tesla-ce  | 127.0.0.1 |
| api.tesla-ce  | 127.0.0.1 |
| moodle.tesla-ce  | 127.0.0.1 |
| storage.tesla-ce  | 127.0.0.1 |
| tesla-ce  | 127.0.0.1 |

In Linux or Mac OS you need to edit /etc/hosts

In OS Windows you need to edit c:\Windows\System32\drivers\etc\hosts


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
