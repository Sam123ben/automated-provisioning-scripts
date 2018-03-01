FROM scratch
ADD Utilities/packages/centos-7-docker.tar.xz /

LABEL name="CentOS Base Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="20180107"

ARG VAULT_PWD
ARG agent_port
ARG master_port
ARG jenkins_version
ARG jenkins_master_run_cmd

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}
ENV JAVA_OPTS="-Dhudson.model.ParametersAction.keepUndefinedParameters=true -Djenkins.install.runSetupWizard=false -Dpermissive-script-security.enabled=true"
ENV JENKINS_SECURITY_REALM HudsonPrivateSecurityRealm
ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log

RUN yum update -y && yum install -y python3 ansible && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/ansible/roles
RUN mkdir -p /root/ansible
RUN ansible-galaxy install geerlingguy.java -p /etc/ansible/roles/

ADD Utilities /root/ansible

RUN ansible-playbook /root/ansible/ansible-playbooks/nabmob.prepare-container.yml --extra-vars "vault_pwd=$VAULT_PWD"