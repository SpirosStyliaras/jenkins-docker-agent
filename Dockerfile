FROM  ubuntu:20.04

LABEL  org.opencontainers.image.author="Spiros Styliaras <spirosstyliaras@gmail.com> " \
       org.opencontainers.image.description="General purpose Jenkins docker agent image"

ENV  DEBIAN_FRONTEND=noninteractive

# Set jenkins user that will be used in runtime
ARG  JENKINS_USER=jenkins
ARG  JENKINS_USER_UID=1000

# Make sure the package repository is up to date and install required packages clean package resources
RUN  apt-get update && \
     apt-get install -y git && \
     apt-get install -y python3 python3-pip python3-venv && \
     apt-get install -y openssh-server && \
     apt-get install -y openjdk-11-jdk && \
     apt-get install -y iproute2 && \
     apt-get install -y iputils-ping && \
     apt-get install -y dnsutils && \
     apt-get install -y curl && \
     rm -rf /var/lib/apt/lists/*

# Add jenkins user to the image and set password
RUN  useradd -m -s /bin/bash -c "Jenkins user" -u $JENKINS_USER_UID $JENKINS_USER && \ 
     echo "jenkins:jenkins" | chpasswd

# Expose Standard SSH port
EXPOSE  22

# Mandatory ssh configuration
RUN  mkdir -p /var/run/sshd

# Set working directory
WORKDIR  /jenkins

# Run command
CMD  ["/usr/sbin/sshd", "-D"]
