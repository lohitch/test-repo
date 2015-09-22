# Installation of Ubuntu
FROM ubuntu:14.04

# Installation of Ansible
RUN apt-get update && \
  apt-get -y install software-properties-common && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git curl ansible && \
  mkdir /opt/myAnsible && \
  cd /opt/myAnsible

# Creating Nginx image using Ansible playbook
COPY provision.yml /opt/myAnsible/provision.yml
WORKDIR /opt/myAnsible
RUN ansible-playbook provision.yml --connection=local
CMD ["/bin/bash"]

