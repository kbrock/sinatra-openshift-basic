#Sinatra openshift v3 basic example

This example is tested on MacOS Sierra
##Install minishift
[Minishift](https://github.com/minishift/minishift)

###Install xhyve

```
$ brew update
$ brew install --HEAD xhyve
```

###Install docker-machine-xhyve

```
$ brew install docker-machine-driver-xhyve

# docker-machine-driver-xhyve need root owner and uid
$ sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
$ sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
```
###Install socat 

```
brew install socat
```

###Install minishift

```
brew cask install minishift
```

##Execute minishift 

```
minishift start --deploy-router
```

##Deploy the app

```
oc login --username=admin --password=admin
oc new-app https://github.com/pollosp/sinatra-openshift-basic.git
oc expose svc/sinatra-openshift-basic
```

##Endpoint information

```
oc status
```

##Rebuild project

```
oc start-build sinatra-openshift-basic
```

##Openshift console
```
minishift console
```

##Openshift IP

```
minishift ip
````

#Log as developer
```
oc login --username=developer --password=developer
```
