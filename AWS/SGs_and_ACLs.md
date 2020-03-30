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

[See response to question here](https://acloud.guru/forums/aws-certified-solutions-architect-associate/discussion/-KTCn8RqocSpPV4RwdQo/what-is-difference-between-stateless-statefull?answer=-LRCbl3J6rRbHNZgyLOK)

* Stateful - Applications or process stores data over time
  * Request maintains state throughout its lifecycle
  * Rule that is stateful sees that request, and when its sent back to the original requestor, the rule "knows" its the same request that came in, so should be allowed out.
  * Request's state as "allowed" is maintained
  * SGs fall into this category because any traffic you spcify as allowed inbound will automatically be allowed outbound

* Stateless - Application or process does not store data over time
  * request has no connection to what occured before or after; what is allowed in s not automatically let back out
  * NACLs fall into this category because you have to explicitly tell it what inbound and outbound traffic to allow independently