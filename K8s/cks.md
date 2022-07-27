# CKS Notes

## Best Practice

### Security principles

* Defense in Depth
* Least Priv
* Limiting the attack surface
  + Removing unecessary applications
  + Firewall rules
  + etc.
  
Redunancy is good... in security

### K8s security categories

#### Host OS security

 * K8s nodes should only do K8s
 * Reduce attack surface

   * Remove unecessary apps
   * keep up to date

 * Runtime Security tools
 * Find and ID malicious processes
 * Restrict IAM/SSH access

#### K8s cluster security

 * K8s components are up to date

   * Apiserver
   * Kubelet
   * ETCD

 * Restrict External access to above
 * Use authentication -> authorization
 * AdmissionControllers

   * NodeRestrictions
   * Custom policies (OPA - Open Policy Agent)

 * Enable audit logging
 * Security benchmarking

#### Application security

* Use secrets/ no hardcoded credentials
* RBAC
* Container sandboxing
* Contianer hardening
  * Attack surface
  * Run as use
  * readonly filesystem
* Vuln scanning
* [mTLS/ServiceMesh](https://techgenix.com/mtls-service-mesh/)

Usually, K8s cluster security and Hos OS security are done in managed providers (GKE, EKS, etc.)

### K8s security best practices

[Talk by Ian Lewis, Google](https://www.youtube.com/watch?v=wqsUfvRyYpw)

## K8s Secure Architecture

### Architecture

See [CKA notes](https://github.com/whompus/notes/blob/master/K8s/cka.md) for general arch. 

### Components

[More on K8s components here](https://kubernetes.io/docs/concepts/overview/components/)

### Secure Component Communication

All You Need to Know About Certificates in Kubernetes
https://www.youtube.com/watch?v=gXz4cq3PKdg

Kubernetes Components
https://kubernetes.io/docs/concepts/overview/components

PKI certificates and requirements
https://kubernetes.io/docs/setup/best-practices/certificates

## Containers under the hood

### Container

* Collection of one or multiple applications
* Includes dependencies
* Jsut a process which runs on the Linux Kernel (but which cannot see everything)

### Kernel vs User Space

<img src="./assets/kernel_user_space.png" height="300">

Syscall Interface can be seen as an API of sorts. Sits on top on Linux Kernel. System calls, like the ones shown, will be provided to libraries like the ones shown or applications. Bridges the cap to the Linux Kernel. 

### Linux Kernel isolation

Container isolation:

[Namespaces](https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/#What-Are-Namespaces) are for isolation, like PIDs, Mounts, Network (adapters, firewall, etc.), and Users. Don't use the host-root user (0) inside a container. Restrict what processes can see like:
* Other processes
* Users
* Filesystem

[cgroups](https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/#What-Are-cgroups) restrict the resource usage of processes like RAM, Disk and CPU.

### Container tools
