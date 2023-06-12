# Getting Started with ArgoCD

<img src="./argocd.png" width="600" height="500" />

<sup>Make sure to enable Docker on your computer before proceeding * <br/>
Download [Docker Desktop](https://www.docker.com/products/docker-desktop/)
</sup>

1. Install 'kubectl' on a Mac Computer using [Homebrew](https://brew.sh/)
```
$ brew install kubectl
```

2. Install k3d
```
$ brew install k3d

// verify using 'k3d verion' command
```

3. Create a cluster config file
```
$ vim cluster-config.yaml

// add followings into it

apiVersion: k3d.io/v1alpha2
kind: Simple
servers: 1
agents: 2
```

4. Create k3d cluster using the command below.
```
$ k3d cluster create argocd-cluster --config ./cluster-config.yaml

// to verify open docker desktop and navigate to containers/apps section
```

> then run 
```
$ kubectl get nodes

// you will see 2-agents and 1-server are running & all their status should be Ready.
```

> $ kubectl cluster-info

you can check the kube config file using the below command
```
$ cat ~/.kube/config

// this will give the configuration details of the cluster
```

### The 3 main components of ArgoCD are:
1. API Server - responsible for application management & status reporting
2. Repository Server - Internal service which maintains a local cache of the git repo
3. Application Controller - Kubernetes controller which continuously monitors running applications


> Check namespaces
```
$ kubectl get namespace
```

5. Create the 'argocd' namespace
```
$ kubectl create namespace argocd
```

> find the [argocd install.yaml file](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)


6. Apply the file using the below command
```
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

7. Check argocd deployments, services, statefulset in the namespace
```
$ kubectl get deployment -n argocd

$ kubectl get service -n argocd

$ kubectl get statefulset -n argocd
```

8. Install argocd CLI
```
$ brew install argocd

// check version
$ argocd version

// check client version
$ argocd version --client
```










