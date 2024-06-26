FROM jenkins/jenkins:2.440.2-lts

USER root

# Add Docker's official GPG key:
RUN apt-get update
RUN apt-get install ca-certificates curl gnupg
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo bookworm) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update

# Setup the health-check
HEALTHCHECK --retries=10 --timeout=20s \
  CMD curl --head -fsS http://localhost:8080/login

