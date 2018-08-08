TAG=shim-build

all: build-with-log copy-shim

build: 
	sudo docker build -t=${TAG} .

build-with-log:
	sudo docker build --no-cache -t=${TAG} . | tee build.log

copy-shim:
	sudo docker run -v ${PWD}:/host:z ${TAG} cp /build/install/shimx64.efi /host;
	sudo chown $$USER:$$USER shimx64.efi

.PHONY: all
