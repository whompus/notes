## Security Groups (SGs) and Network Access Control Lists (NACLs)

### SGs

* These live at the _instance_ level and are required for each instance
* Essentially like firewall rules for EC2 instances, controls traffic to and from the instance based on specified rules
* Can be used across subnets and on multiple instances
* More precisely, a security group is associated with a network interface that is attached to an instance

### NACLs

* These live at the _subnet_ level
* Controls traffic to and from a subnet according to a set of inbound and outbound rules
* Can be applied to one of more subnets, but only _one_ NACL on a subnet is allowed


### Stateful versus Stateless

* Stateful 