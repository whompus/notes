## CKA Notes and Study Materials

- [Big-Picture Overview](#big-picture-overview)
- [K8s Control Plane and Components](#k8s-control-plane-and-components)
  - [kube-api-server](#kube-api-server)
  - [etcd](#etcd)
  - [kube-scheduler](#kube-scheduler)
  - [kube-controller-manager](#kube-controller-manager)
  - [cloud-controller-manager](#cloud-controller-manager)
- [K8s Nodes](#k8s-nodes)
  - [kubelet](#kubelet)
  - [container runtime](#container-runtime)
  - [kube-proxy](#kube-proxy)
- [Building a K8s cluster](#building-a-k8s-cluster)
  - [kubeadm](#kubeadm)
- [Using Namespaces in K8s](#using-namespaces-in-k8s)
- [K8s Management](#k8s-management)
  - [Intro to K8s High-Availability (HA)](#intro-to-k8s-high-availability-ha)
  - [Intro K8s Management Tools](#intro-k8s-management-tools)
  - [Safely Draining a K8s Node](#safely-draining-a-k8s-node)
  - [Upgrading K8s with `kubeadm`](#upgrading-k8s-with-kubeadm)
  - [Backup and restore etcd cluster data](#backup-and-restore-etcd-cluster-data)
- [K8s Object Management](#k8s-object-management)
  - [Basic commands - working with `kubectl`](#basic-commands---working-with-kubectl)
  - [Kubectl Tips](#kubectl-tips)
  - [RBAC](#rbac)
  - [Service accounts](#service-accounts)
  - [Inspecting Pod Resource Usage](#inspecting-pod-resource-usage)
- [Pods and Containers](#pods-and-containers)
  - [Managing application configuration](#managing-application-configuration)
  - [Managing container resources](#managing-container-resources)
  - [Monitor container health with probes](#monitor-container-health-with-probes)
  - [Demo](#demo)
# Big-Picture Overview

<img src="./assets/big_picture.png" height="400">

# K8s Control Plane and Components

The control plane is collection of multiple compnents resonsible for managing the cluster globally.

Individual control plane compnents can run on any machine in the cluster, but usually are run on dedicated *controller* machines.

<img src="./assets/control_plane.png" height="400">

## kube-api-server

Frontend; serves the K8s API which is the primary interface to the control plane and cluster itself.

You will usually interact with your cluster with this API.

## etcd

Backend data store for the kubernetes cluster/API. Provides high-availability storage for all data relating to the state of the cluster.

When performing operations against the API, data is being read from and written to etcd.

## kube-scheduler

Scheduling means selecting an available node in the cluster on which to run containers.

When using the API, for example, to run a pod or container, kube-scheduler is the component responsbile for assigning that container to a worker node.

## kube-controller-manager

Runs a collection of multiple controller utilities in a single process.

Manages utility processes related to automation within the cluster.

## cloud-controller-manager

Provides an interface between K8s and various cloud platforms. Only used when using cloud-based resources alongside K8s.

# K8s Nodes

Machines where containers are run in the cluster.

<img src="./assets/nodes.png" height="400">

## kubelet

K8s agent that runs on each node. Communicates with the control plane. Basically manages containers on each node.

Handles process of reporting container status and other data about containers back to the control plane. Status of the node, various information about each container running on that node, etc.

## container runtime

Separate from K8s, not built in. Separate piece of software for actually running the containers.

K8s supports multiple container runtime implementations including Docker and containerd.

## kube-proxy

Network proxy, runs on each node and handles some tasks relating ot networking between containers and services in the cluster.

# Building a K8s cluster

## kubeadm

Tool that will simplify the process of setting up our kubernetes cluster.

[Building a Kubernetes Cluster](./assets/1623334133949-Building%20a%20Kubernetes%20Cluster.pdf)

# Using [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) in K8s

Namespaces are essentially virtual clusters backed by the same physcial cluster. Kubernetes objects, such as pods and containers, live in namespaces. Namepsaces are a way to separate and organize objecs in your cluster.

In Kubernetes, namespace provides a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces. Namespace-based scoping is applicable only for namespaced objects (e.g. Deployments, Services, etc) and not for cluster-wide objects (e.g. StorageClass, Nodes, PersistentVolumes, etc).

Kubernetes starts with four initial namespaces:

* `default` The default namespace for objects with no other namespace

* `kube-system` The namespace for objects created by the Kubernetes system

* `kube-public` This namespace is created automatically and is readable by all users (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.

* `kube-node-lease` This namespace holds Lease objects associated with each node. Node leases allow the kubelet to send heartbeats so that the control plane can detect node failure.

Useful for different apps in your cluster or for different teams in your cluster

List existing namespaces: `kubectl get namespaces`

All clusters have a default namespace. This is use when no other namespace is specified. *NOTE:* the default namespace is used when no other namespaces are specified. K8s is going to assume you want to use that default namespace.

Kubeadm clusters also have a namespace called `kube-system` , which contains system components, such as the components of the Kubernetes control plane itself.

When you're working with Kubernetes via kubectl, you may need to sometimes specify a namespace and you can do this with the
`--namespace` flag: `kubectl get pods --namepsace my-namespace`

Create a namespace: `kubectl create namespace my-namespace`

# K8s Management

## Intro to K8s High-Availability (HA)

K8s facilitates HA applications, but you can also design the cluster itself to be HA. Need *multiple control plane nodes* to do this.

When using multiple control planes for HA, you will likely need to communicate with the K8s API via a Load Balancer. This iobncludes clients such as kubelet instances running on worker nodes. 

<img src="./assets/basic_ha.png" height="400">

### Stacked etcd

<img src="./assets/stacked_etcd.png" height="400">

Runs on the same nodes as the rest of the control plane components. Design pattern used by clusters that are setup by `kubeadm` .

Each individual control plane nodes would have it's own etcd instance.

### External etcd

<img src="./assets/external_etcd.png" height="400">

Etcd lives on completely different servers than where we are running our normal K8s control plane components. 

You can have any numver of K8s control plane instances and any number of etcd nodes. 

## Intro K8s Management [Tools](https://kubernetes.io/docs/reference/tools/)

There is a variety of management tools available for K8s. These tools interface with K8s to provide additional functionality. When using K8s, it is a good idea to be aware of some of these tools.

### `kubectl`

The official command line interface for K8s. It is the main method of interacting with K8s in the CKA.

### `kubeadm`

Tool that allows you to quickly and easily create K8s clusters. Like setting up the control plane and worker nodes.

### minikube

Allows for easy setup of a cluster with a single machine. Supports multi-nodes on local device.

### [Helm](https://medium.com/prodopsio/a-6-minute-introduction-to-helm-ab5949bf425)

Provides templating and package management system for K8s objects. You can use it to manage your own templates (known as charts). You can also download and use shared templates. 

### Kompose

Helps you translate Docker compase files into K8s objects.

### Kustomize

A config mananagement tool for managing K8s object configs. 

## Safely Draining a K8s Node

### What is draining?

When performing maintenance, you may sometimes need to remove a K8s node from service.

To do this, you can drain the node. Containers running on the node will be gracefully terminated (and potentially rescheduled to another node)

Diagram of drain process:

<img src="./assets/kubectl_drain.png" height="400">

### How to drain

To drain a node, use the `kubectl drain` command, e.g. `kubectl drain <node name> --ignore-daemonsets`

When draining a node, you may need to ignore [DaemonSets](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) (like the command above). DaemonSets are pods that are tied to each node. If you have any DaemonSet pods running on the node, you will likely need to use the `--ignore-daemonsets` flag.

Uncordoning a Node - If the node remains part of the lcuster, you can allow pods to run on the node again when maintenance is complete using `kubectl uncordon <node name>` .

Cordoning the node means no pods should run on that node. 

In our lab, we got this error:

```
cloud_user@k8s-control:~$ kubectl drain k8s-worker1
node/k8s-worker1 cordoned
error: unable to drain node "k8s-worker1", aborting command...

There are pending nodes to be drained:
 k8s-worker1
cannot delete Pods not managed by ReplicationController, ReplicaSet, Job, DaemonSet or StatefulSet (use --force to override): default/my-pod
cannot delete DaemonSet-managed Pods (use --ignore-daemonsets to ignore): kube-system/calico-node-28p6s, kube-system/kube-proxy-bfpmh
```

Two things happening here, let's take a closer look at these errors:

1. `cannot delete Pods not managed by ReplicationController, ReplicaSet, Job, DaemonSet or StatefulSet (use --force to override): default/my-pod`
   
   This is referring to our individual pod we created: `default/my-pod` . It is not able to reschedule that pod to another worker node. It's going to abort the drain process because it doesn't want to just delete that pod

2. `cannot delete DaemonSet-managed Pods (use --ignore-daemonsets to ignore): kube-system/calico-node-28p6s, kube-system/kube-proxy-bfpmh`
    This is saying that it's not able to delete those DaemonSet managed pods. If we look closer, `kube-system/calico-node-28p6s, kube-system/kube-proxy-bfpmh` are K8s system pods that were created when we installed the calico networking plguin and also the kubeadm process.

To solve the first error, we want to use `--force` , which will actually delete that first pod. If you're in a situation where you can't lose that pod, don't use `--force`

After running `kubectl drain k8s-worker1 --ignore-daemonsets --force` , we see that the pods are evicted:

```
cloud_user@k8s-control:~$ kubectl drain k8s-worker1 --ignore-daemonsets --force
node/k8s-worker1 already cordoned
WARNING: ignoring DaemonSet-managed Pods: kube-system/calico-node-28p6s, kube-system/kube-proxy-bfpmh; deleting Pods not managed by ReplicationController, ReplicaSet, Job, DaemonSet or StatefulSet: default/my-pod
evicting pod default/my-pod
pod/my-pod evicted
node/k8s-worker1 evicted
```

`my-pod` is essentially deleted. But pods part of the deployment (not `my-pod` ), we will see that another replica was scheduled to run just to keep that number of deployment replicas at 2:

```
cloud_user@k8s-control:~$ kubectl get pods -o wide
NAME                             READY   STATUS    RESTARTS   AGE   IP              NODE          NOMINATED NODE   READINESS GATES
my-deployment-5f85c44867-q7ds5   1/1     Running   0          20m   192.168.126.2   k8s-worker2   <none>           <none>
my-deployment-5f85c44867-v4s97   1/1     Running   0          20m   192.168.126.1   k8s-worker2   <none>           <none>
```

We see that both replicas are now running on the second worker node.

Last thing is uncordon and clean up (notice the `Ready,SchedulingDisabled` ) on the first worker node after draining:

```
cloud_user@k8s-control:~$ kubectl get nodes
NAME          STATUS                     ROLES                  AGE   VERSION
k8s-control   Ready                      control-plane,master   44h   v1.21.0
k8s-worker1   Ready,SchedulingDisabled   <none>                 44h   v1.21.0
k8s-worker2   Ready                      <none>                 44h   v1.21.0
```

Uncordon the node:

```
cloud_user@k8s-control:~$ kubectl uncordon k8s-worker1
node/k8s-worker1 uncordoned
```

Uncordoning the node did not rebalance the pods. If you schedule any new pods or deployments, they will run on that node. 

Clean up:

```
cloud_user@k8s-control:~$ kubectl delete deployment my-deployment
deployment.apps "my-deployment" deleted
```

Walkthrough: [Safely Draining a Node](./assets/safe_draining.pdf)

#### Notes on Deployments

`kubectl get pods -o wide` - the `-o wide` gives node information as well.

In our deployments, when we specify replicas, each replica should run on a different node ( # TODO: fact-check this). If you find that both replicas are running on the same node, increase the replicas until they are runnign on different nodes.

[Pods vs. Deployments](https://stackoverflow.com/questions/41325087/what-is-the-difference-between-a-pod-and-a-deployment)

## Upgrading K8s with `kubeadm`

[Reference materials](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/_) from official documentation.

### Control plane upgrade steps

1. Drain the node
 `kubectl drain k8s-control --ignore-daemonsets`

2. Upgrade kubeadm on the control plane node
   

```
sudo apt-get update && \

# override that kubeadm is in in the hold status which prevents upgrades
sudo apt-get install -y --allow-change-held-packages kubeadm=1.22.2-00
```

3. Plan the upgrade (`sudo kubeadm upgrade plan v1.22.2`)
   * This command will give information about what will need to be changed in order to perform this upgrade 
4. Apply the upgrade (`sudo kubeadm upgrade apply v1.22.2`)
5. Upgrade kubelet and kubectl on the control plane node

```
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubelet=1.22.2-00 kubectl=1.22.2-00
```

6. In case kubelete service had any changes, run `sudo systemctl daemon-reload` and `sudo systemctl restart kubelet`
7. Uncordon the control plane node with `kubectl uncordon k8s-control`

### Worker node upgrade steps

1. Drain the node
2. Upgrade kubeadm
3. Upgrade the kubelet configuration ( `kubeadm upgrade node` )
4. Upgrade kubelet and kubectl
5. Uncordon the node

Steps found [here](./assets/upgrade_kubeadm.pdf)

## Backup and restore etcd cluster data

[Reference docs](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)

### Why back up etcd?

`etcd` is the backend data storage solution for your kubernetes cluster. As such, all your Kubernetes objects, applications, and configurations are stored in etcd. 

Therefore, you will likely want to be able to back up your cluster's data by backing up etcd. If your etcd data is lost, you'll have to rebuild all your k8s applications by hand.

### Backing it up

We will back up data by using the `etcdctl` command line tool.

Using `etcdctl snapshot save` command to back up the data. `ETCDCTL_API=3 etcdctl --endpoints $ENDPOINT snapshot save <filename>`

### Restoring etcd

You can [restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#restoring-an-etcd-cluster) etcd data from a backup using the `etcdctl snapshot restore` command. You will need to supply some additional parameters, as the restore operation creates a new logical cluster.

Lab Guide:

```
Introduction
Backups are an important part of any resilient system. Kubernetes is no exception. In this lab, you will have the opportunity to practice your skills by backing up and restoring a Kubernetes cluster state stored in etcd. This will help you get comfortable with the steps involved in backing up Kubernetes data.

Solution
Log in to the provided lab server using the credentials provided:

ssh cloud_user@<PUBLIC_IP_ADDRESS>
Back Up the etcd Data
Look up the value for the key cluster.name in the etcd cluster:

ETCDCTL_API=3 etcdctl get cluster.name \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
The returned value should be beebox.

Back up etcd using etcdctl and the provided etcd certificates:

ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
Reset etcd by removing all existing etcd data:

sudo systemctl stop etcd
sudo rm -rf /var/lib/etcd
Restore the etcd Data from the Backup
Restore the etcd data from the backup (this command spins up a temporary etcd cluster, saving the data from the backup file to a new data directory in the same location where the previous data directory was):

sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db \
  --initial-cluster etcd-restore=https://10.0.1.101:2380 \
  --initial-advertise-peer-urls https://10.0.1.101:2380 \
  --name etcd-restore \
  --data-dir /var/lib/etcd
Set ownership on the new data directory:

sudo chown -R etcd:etcd /var/lib/etcd
Start etcd:

sudo systemctl start etcd
Verify the restored data is present by looking up the value for the key cluster.name again:

ETCDCTL_API=3 etcdctl get cluster.name \
  --endpoints=https://10.0.1.101:2379 \
  --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
  --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
  --key=/home/cloud_user/etcd-certs/etcd-server.key
The returned value should be beebox.
```

# K8s Object Management

References for objects:

[Kubeneretes.io documentation on objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
[Understanding kubernetes objects](https://www.magalix.com/blog/understanding-kubernetes-objects)

You can also run `kubectl api-resources` to get all k8s objects.

## Basic commands - working with `kubectl`

### `kubectl get`

Use kubectl get to list objects in the K8s cluster:
 `kubectl get <object type> <object name> -o <output> --sort-by <JSONPath> --selector <selector>`

* `-o`: set output format like yaml or json
* `--sort-by`: sort output using a JSONPath expression
* `--selector`: filter results by [label](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)

### `kubectl create`

Used to create objects. Supply a YAML file with `-f` to create an object from a YAML descripto stored in a file. 

 `kubectl create -f <file name>`

If you attempt to create an object that already exists, an error will occur.

### `kubectl apply`

Similar to to `kubectl create` . However, if you use `kubectl apply` on and object that already exists, it will modify the existing object, if possible.

 `kubectl apply -f <file name>`

### `kubectl delete`

Deletes objects from the cluster.

 `kubectl delete <object type> <object name>`

### `kubectl exec`

Run commands inside containers. KLeep in mind that, in order for a command to succeed, the necessary software must exist within the container to run it. For toubleshooting and seeing what is going on inside your containers. use `-c` if your pod has multiple containers.

 `kubectl exec <pod name> -c <container name> -- <command>`

### More on `kubectl`

More info on [ `kubectl` operations](https://kubernetes.io/docs/reference/kubectl/overview/)

And even more in depth [here](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-strong-getting-started-strong-).

## Kubectl Tips

Imperative commands, Quick sample YAML, Export YAML from an object, Using the K8s.io docs, etc.

### Imperative commands

So far, we've been using [*declarative*](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/) commands which define objects using data structures such as YAML or JSON and using `kubectl create|apply` to instantiate those objects.

Imperative commands define objects using kubectl commands and flags instead of yaml files, e.g. `kubectl create deployment my-deployment --image=nginx`

### Quick sample YAML

Use the `--dry-run` flag to run an imperative command without creating an object. Combine it with `-o yaml` to quickly obtain a sample yaml file you can manipulate.

You can record a command with the `--record` flag. E.g. `kubectl scale deployment my-deployment --replicas=5 --record` .

Then, within the object after `kubectl describe <object>` you can see the command in the annotations. 

### Use the docs

You can often find YAML examples in the K8s documentation. You are allowed to use this documentation during the exam. Feel free to copy and paste example YAML and/or coammdns from the docs.

## RBAC

[RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) allows you to control what users are allowed to do and access in your cluster. E.g. allow devs to read metadat and logs from K8s pods but not make changes to them.

### Roles and Cluster Roles

K8s objects that define a set of perms. These perms determine what users can do in the cluster. 

A *Role* defines perms within a particular ns, and a *ClusterRol*e defines cluster-wide perms not specific to a single ns. RoleBindings are objects that link users to *Roles* and *ClusterRoleBindings* link users to cluster roles. 

*RoleBinding* and *ClusterRoleBinding* are objects that connect Roles and ClusterRoles to users. These determine which users are allowed to use the permissions that are defined in the role and cluster. 

<img src="./assets/rbacobjects.png" height="400">

[Sample RBAC Config](./assets/rbac_sample.pdf)

For roles, need both a `role` and `roleBinding` definition (in two separate files? # TODO fact-check this). same with cluster stuff. 

In our role file, `rules:` define what permissions are associated with a partocular role. Define a set of `resources:` , `verbs:` state what action can be done with the resource

In our rolebinding file, `subjects:` defines what users this role binding applies to. `roleRef:` is what connects our role binding to the actual role. 

### For hands-on lab:

"Create a role called pod-reader. Provide it with read access to pods and container logs in the beebox-mobile namespace."

Solution:

* generate yaml file for role using imperative command: `kubectl create role pod-reader --resource=pods,pods/log --namespace=beebox-mobile --verb=get,list,watch --dry-run=client -o yaml > pod-reader-role.yml`
* generate roleBinding yml: `kc create rolebinding pod-reader --role=pod-reader --user=dev --namespace=beebox-mobile --dry-run=client -o yaml > pod-reader-rolebinding.yml`

`kubectl apply -f` both, profit. 

## Service accounts

In K8s a [service account](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/) is an account used by container processes within pods to authenticate with the K8s API.

If your pods need to communicate with the k8s API, you can use service accounts to control their access.

### Creating service accounts

A service account object can be created with some YAML just like any other k8s object:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-serviceaccount
```

You can manage access control for service accounts, just like anyother use, using RBAC objects.

Bind service accounts with ClusterRoles or ClusterRoleBindings to provide access to K8s API functionality.

What it looks like to bind a role to a service account usign a RoleBinding:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: sa-pod-reader
subjects:
- kind: Service Account
  name: my-serviceaccount
  namespace: default
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

`kubectl get sa` will list service accounts.

`kubectl describe sa my-serviceaccount` will describe the service account.

## Inspecting Pod Resource Usage

[Tools for monitoring resources](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)

[ `kubectl` cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#interacting-with-running-pods)

[Resource metrics pipeline](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/)

### K8s Metrics Server

In order to view metrics about the resources pods and containers are using, we need an add-on to collect and provide that data. One such add-on is the Kubernetes Metrics Server.

Once we've installed the add-on we can use `kubectl top` command.
* Can view data abour reource usage in your pods and nodes
* Also supports flags like `--sort-by` and `--selector`
* `kubectl top pod --sort-by <JSONPATH> --selector <selector>`

How to install and use (basic): [Hands-on demo](./assets/inspecting_resources.pdf)

Querying the metrics server API: `kubectl get --raw /apis/metrics.k8s.io`

Can also check node CPU usage: `kubectl top node`

# Pods and Containers

## Managing application configuration

### Application configuration

When you are running apps in K8s, you may want to pass dynamic calues to your applications at runtime to control how they behave. This is known as application configuration.

Bascially passing data to containers that conrols how they run. 

You can store configuration data in [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/). These are key-value maps and they can be passed to your container applications.

Can also store config data in [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/), which is for more sensitive data. These need to be b64 encoded within a yaml file.
One way to pass the configmap and secrets to your containers is through [environment variables](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/).
These variables will be visible to your container process at runtime:

```yaml
spec:
  containers:
  - ...
    env:
    - name: ENVVAR
      valueFrom:
        configMapRef:
          name: my-configmap
          key: mykey
```

`$ENVVAR` will then be passed to our container process.

Configuration data from ConfigMaps and Secrets can also be passed to containers in the form of mounted volumes. This will cause the configuration data to appear in files available to the container file system.

Each top-level key in the configuration data will appear as a file containing all keys below that top-level key.

[Hands-on demo](./assets/config_maps_and_secrets.pdf)

## Managing container resources

### Resource requests

[Resource requests](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits) allow you to define an amount of resources (like CPU and mem) that a container can use or you expect it to use. The scheduler will then avoid scheduling pods on nodes that do not have the available resources. 

Example: if your resource request is asking for 5 gb of mem, and there isn't 5 gb available on a node, the scheduler will look for a different node with that mem available.

*NOTE:* containers are allowed to use more (or less) than the requested resources. *Resource requests only affect scheduling, not what happens after the pod is scheduled for a node*. Moreover, the resource request does not force the container to stay within that limit. 

Example resource request:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: busybox
    image: busybox
    resources:
      requests:
        # CPU is measured in CPU units, which are 1/1000 of one CPU or 1/4 of a cpu
        cpu: "250m" # this is 250 milli-CPUs
        # Memory is measured in bytes
        memory: "128Mi"
```

### Resource limits

The container runtime is responsible for enforcing the [resource limit](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits) after scheduling, and different CRs do this differently.

Some runtimes will enforce these limits by terminating container processes that attempt to use more than the allowed amount of resources.

Example resource limit:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
    name: busybox
    image: busybox
    resources:
      limits:
        cpu: "250m"
        memory: "128Mi" 
```

[Hands-on demo](./assets/resources_hands_on.pdf)

## Monitor container health with [probes](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#types-of-probe)

### Container health

K8s provides a number of features that allow you to build robust apps, such as the ability to to automatically restart unhealthy containers. To make the most of those features, K8s needs to be able to accurately determine the status of your apps. This means actively monitoring container health. More in this in [pod lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/)

### Liveness Probes

Allows you to automatically determine whether or not a container application is in a healthy state and/or running. If the liveness probe fails, the kubelet kills the container, and the container is subjected to its [restart policy](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy). If a container does not provide a liveness probe, the default state is `Success`

By default, *K8s will only consider a container to be "down" if the container process stops*. 

Liveness probes allow us to customize this detection mechanism and make it more sophisticated. Sometimes your containers might still be running. The process might not have stopped, but things are still broken. With liveness probes, we can detect those more sophisticated, more subtle situations where things aren't working, but the container is still running.

### Startup probes

Similar to liveness probes, but the difference is these run on startup and stop running once they succeed. Whereas liveness probes are constantly running and checking container status.

These check whether the application within the container has started. *All other probes are disabled if a startup probe is provided, until it succeeds*. 

If the startup probe fails, the kubelet kills the container and the container is subjected to its restart policy. If a container does not provide a startup probe, the default state is `Success`

### Readiness probes

Used to determine when a container is ready to accept requests. If the readiness probe fails, the endpoints controller removes the Pod's IP addess from the endpoints of all Services that match the Pod. 

When you have a service backed by multiple container endpoints, use traffic will not be sent to a particular pod until its containers have all passed the readiness checks defined by their readiness probes.

The default state of readiness before the initial delay is `Failure`. If a container does not provide a readiness probe, the default state is Success.

### [Check mechanisms](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#probe-check-methods)

These are ways to check containers using probes via different methods.

## Demo 

[Hands on demo for pod lifecycle and container Probes](./assets/probes_hands_on.pdf)
