build_provisioner:
	# docker build -t openio/node:latest openio-node/
	pushd $(shell pwd)/provisioner && docker build --build-arg ts=$(shell date +%s) -t openio/provisioner:latest . && popd

build_node:
	pushd $(shell pwd)/openio-node && docker build --build-arg ts=$(shell date +%s) -t openio/node . && popd

buildall:
	pushd $(shell pwd)/provisioner && docker build --build-arg ts=$(shell date +%s) -t openio/provisioner:latest . && popd
	pushd $(shell pwd)/openio-node && docker build --build-arg ts=$(shell date +%s) -t openio/node . && popd

boot:
	echo "" > docker-compose.yml
	echo $(shell pwd)
	docker run -ti -v $(shell pwd)/docker-compose.yml:/root/docker-compose.yml -v $(shell pwd)/config.yml:/root/config.yml openio/provisioner:latest /root/generate
	docker-compose up -d
	docker run -ti --net=oioprovision_openio -v $(shell pwd)/config.yml:/root/config.yml \
	openio/provisioner /bin/bash -c "/root/render && ansible-playbook -i /root/hosts /root/playbook.yml --extra-vars openio_bootstrap=1"

update:
	echo "" > docker-compose.yml
	echo $(shell pwd)
	docker run -ti -v $(shell pwd)/docker-compose.yml:/root/docker-compose.yml -v $(shell pwd)/config.yml:/root/config.yml openio/provisioner:latest /root/generate
	docker-compose up -d
	docker run -ti --net=oioprovision_openio -v $(shell pwd)/config.yml:/root/config.yml \
	openio/provisioner /bin/bash -c "/root/render && ansible-playbook -i /root/hosts /root/playbook.yml"

stop:
	docker-compose down
