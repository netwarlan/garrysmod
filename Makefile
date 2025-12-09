.PHONY: build run stop clean logs shell

IMAGE_NAME := netwarlan/garrysmod
CONTAINER_NAME := garrysmod-server
PORT := 27015

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):27015/udp \
		-p $(PORT):27015/tcp \
		$(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean: stop
	docker rmi $(IMAGE_NAME)

logs:
	docker logs -f $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/bash
