# wsdd-docker
Docker image for wsdd.py.

[wsdd git repository](https://github.com/christgau/wsdd)

## What is wsdd
wsdd implements a Web Service Discovery host daemon. This enables (Samba) hosts, like your local NAS device, to be found by Web Service Discovery Clients like Windows.

It also implements the client side of the discovery protocol which allows to search for Windows machines and other devices implementing WSD. This mode of operation is called discovery mode.


## How to use this image
Start a wsdd instance:

```bash
$ docker run -p 3702:3702 -p 5357:5357 -e HOST=somehost -d shvargon/wsdd
```

Other arguments can be passed as arguments. Example run verbose mode:

```bash
$ docker run -p 3702:3702 -p 5357:5357 -e HOST=somehost -d shvargon/wsdd -v
```

See the wsdd repository for available arguments


Here is an example using docker-compose.yml:

```yaml
wsdd:
  image: shvargon/wsdd
  ports:
   - "3702:3702"
   - "5357:5357"
  environment:
   - HOST=somehost
```

## Environment Variables
### HOST 
Override the host name wsdd uses during discovery. 

### WORKGROUP
By default wsdd reports the host is a member of a workgroup rather than a domain (use the -d/--domain option to override this). With -w/--workgroup the default workgroup name can be changed. The default work group name is WORKGROUP. The (provided) hostname is automatically converted to upper case. Use the -p option to change this behavior.