# Sinatra openshift v3 basic example
[![wercker status](https://app.wercker.com/status/78996ad35b2627627b21efcdb2690472/s/master "wercker status")](https://app.wercker.com/project/byKey/78996ad35b2627627b21efcdb2690472)

This example is tested on MacOS Sierra
## Install minishift
[Minishift](https://github.com/minishift/minishift)

### Install xhyve

```
$ brew update
$ brew install --HEAD xhyve
```

### Install docker-machine-xhyve

```
$ brew install docker-machine-driver-xhyve

# docker-machine-driver-xhyve need root owner and uid
$ sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
$ sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
```
### Install socat 

```
brew install socat
```

### Install minishift

```
brew cask install minishift
```

## Execute minishift 

With version 0.9.0

```
minishift start --deploy-router
```
With last version just 

```
minishift start --openshift-version v1.5.0-alpha.3
```
## Deploy the app

```
oc login --username=admin --password=admin
oc new-app https://github.com/pollosp/sinatra-openshift-basic.git
oc expose svc/sinatra-openshift-basic
```

## Endpoint information

```
oc status
```

## Rebuild project

```
oc start-build sinatra-openshift-basic
```

## Openshift console
```
minishift console
```

## Openshift IP

```
minishift ip
````

# Log as developer
```
oc login --username=developer --password=developer
```
