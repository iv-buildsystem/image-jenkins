# jenkins-image
A jenkins images that can use docker. This creates a docker image with Jenkins and the Docker CLI.

Notes
 - The CLI version installed should match the host engine's version number. To list the available version:
   - Note the host machine's version number: `docker --verson`
   - Build and run the jenkins image: `./build.sh && ./run.sh`
   - List the available version from the container: `docker exec Jenkins apt-cache madison docker-ce-cli`
   - Edit the Dockerfile and update the DOCKER_VERSION variable with the correct version from the container
   - Rebuild

Known Issues:
 - The container is using the root user. I haven’t figured out how to use the host’s dockerd socket with the `jenkins` user.

