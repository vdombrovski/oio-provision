OpenIO SDS Docker image spawner/provisioner
===

> Important note: this project is still WIP, so expect bugs and problems.

Description:
---

Spawns docker images for OpenIO nodes, and configures a namespace on them. Configurable via config.yml

Basic Setup
---

On the host machine, install docker, docker-compose, make, git

```sh
apt install -y docker docker-compose make git
```

Clone the repo

```sh
git clone https://github.com/vdombrovski/oio-provision.git
cd oio-provision
```

Build the base images (will take a while)

```sh
make buildall
```

Bootstrap a 3 node cluster
```sh
make boot
```

Test: login onto a node and push an object
```
docker exec  -ti oioprovision_node1_1 /bin/bash
openio object create test /etc/magic --oio-ns OPENIO --oio-account TESTACC
openio object list test --oio-ns OPENIO --oio-account TESTACC
```

Scale
---

In config.yml, update *openio* to the number of nodes you want (WARNING: more nodes require more resources on the host machine)

Example:

```sh
cat config.yml
# OpenIO provisioner config file

openio: 5
openio_directory_m0: 3
openio_directory_m1: 3
openio_conscience: 1
openio_zk_cluster: 3
openio_redis_cluster: 3
```

Update the cluster

```sh
make update
```

Login onto a node and verify that more services have been added
```
docker exec  -ti oioprovision_node1_1 openio cluster list --oio-ns OPENIO
```

You should see 5 different IPs of servers, and **no scores=0**. If you do, unlock the scores manually
```
docker exec  -ti oioprovision_node1_1 openio cluster unlockall --oio-ns OPENIO
```

Stop cluster
---

On the host machine

```
make stop
```

Contribute
---

Contributions and issues are welcome!

TODO
---

- volume configuration
- swift integration
- more!
