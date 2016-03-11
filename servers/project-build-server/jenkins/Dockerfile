FROM jenkins

# Docker & AWS CLI
USER root
RUN apt-get update && apt-get install -y docker.io && groupadd -g 497 host-docker && usermod -a -G host-docker jenkins && \
    apt-get install -y python-pip && rm -rf /var/lib/apt/lists/* && pip install awscli && \
    curl -so /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod +x /usr/local/bin/ecs-cli

# Plugins
COPY plugins.txt /usr/share/jenkins/ref
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Setup
COPY setup.groovy /usr/share/jenkins/ref/init.groovy.d

# Jobs
COPY jobs /tmp/jobs
RUN chown -R jenkins:jenkins /tmp/jobs
USER jenkins

# HTTPS
#COPY https.pem /var/lib/jenkins/cert
#COPY https.key /var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#EXPOSE 8083