
# TeSLA CE docker-compose test version

| :warning: This repository is **under construction**. Final release of TeSLA Community Edition source code is expected by the **end of 2021** |
| --- |

This repository provides a fast deploy of TeSLA CE system for evaluation and testing purposes. Do not intent to use it in production environment. Vault is started in dev mode and data will be lost when container is destroyed. 

| :warning: Access to **private** repository is needed |
| --- |

It is necessary access to private repository to use:
- Dashboard
- Moodle
- LTI

## Instructions

1. Execute preinstall script (preinstall.sh) and get moodle information and FR provider information.
```
./preinstall.sh
```

2. Edit your local machine DNS the following entries:

|Address | Domain |
|---|---|
| 127.0.0.1 | lti.tesla-ce |
| 127.0.0.1 | api.tesla-ce |
| 127.0.0.1 | moodle.tesla-ce |
| 127.0.0.1 | storage.tesla-ce |
| 127.0.0.1 | tesla-ce |

In Linux or Mac OS you need to edit /etc/hosts

In OS Windows you need to edit c:\Windows\System32\drivers\etc\hosts


## Observations:
If used domain (tesla-ce in the example) is not a valid domain, the generated certificates are self-signed. In order your browser accept them, first visit:
- https://tesla-ce
- https://moodle.tesla-ce
- https://lti.tesla-ce
- https://storage.tesla-ce

And accept the provided certificate.

## Start TeSLA CE environment with make:

### All process
```
make
```

### First configure.
```
make configure
```

### Second start core
```
make core
```

### Third start moodle
```
make moodle
```

### Fourth start provider-tfr
```
make provider-tfr
```

## Shutdown TeSLA CE environment with make:
```
make stop
```

## Clean TeSLA CE environment with make:
```
make clean
```

## Start TeSLA CE environment without make:

### First of all start services.
```
docker-compose -f docker-compose.tesla_services.yml up -d
```

### Second start TeSLA Core
Remember to login to private repostiory
| :warning: Remember to login to **private** repostiory |
| --- |
```
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml up -d
```
### Third moodle
```
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml up -d
```

### Fourth start Face Recognition provider 
```
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.tfr.yml up -d
```

## Shutdown TeSLA CE environment without make:
```
docker-compose -f docker-compose.tesla_services.yml -f docker-compose.tesla_core.yml -f docker-compose.moodle.yml -f docker-compose.tfr.yml stop
```

If you remove containers, remember to reconfigure.

## Moodle

Default data:

| Field | Value |
|---|---|
| User | moodle |
| Password | admintesla |
| Email | admin@tesla-ce.eu |


 
