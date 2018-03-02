# Project regarding the AWX (AnsibleWorks: Ansible Tower) to Dockerize it

FROM ubuntu:trusty

LABEL maintainer rout.samyak@nab.com.au

ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG tower_version

ENV http_proxy ${http_proxy}
ENV https_proxy ${https_proxy}
ENV no_proxy "${no_proxy}"
ENV LC_ALL "en_US.UTF-8"
ENV ansible_tower_ver "${tower_version}"
ENV PG_DATA "/var/lib/postgresql/9.6/main"

RUN apt-get -y update \
        && apt-get -y install software-properties-common \
        && apt-add-repository ppa:ansible/ansible && apt-get -y update && apt-get install -y ntp ansible \
        && apt-add-repository ppa:jonathonf/python-3.6 && apt-get -y update && apt-get install -y python3.6
RUN mkdir -p /opt/ansible-utilities

ADD Utilities /opt/ansible-utilities

RUN ansible-playbook /opt/ansible-utilities/main.yml --extra-vars "ansible_tower_ver=${tower_version}"

RUN /usr/share/ansible-tower/ansible-tower-setup/ansible-tower-setup-${ansible_tower_ver}/setup.sh

VOLUME ["${PG_DATA}", "/certs"]
EXPOSE 443

CMD ["/docker-entrypoint.sh", "ansible-tower"]