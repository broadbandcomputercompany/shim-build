# shim-build

Build [shim](https://github.com/rhboot/shim) in a Docker container.

## Makefile targets

Build shim in a Docker container:

	build

Build with the cache turned off to get the full build log:

	build-with-log

Copy the shim build from the container to the host:

	copy-shim

Build shim with build log && copy shim build to host (default target):

	all
