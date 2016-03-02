FROM jenkins

# Plugins
COPY plugins.txt /usr/share/jenkins/ref
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Setup
COPY setup.groovy /usr/share/jenkins/ref/init.groovy.d

# Jobs
COPY seed.xml jobs.groovy /tmp/seed/
USER root
RUN chown -R jenkins:jenkins /tmp/seed

# Docker
RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/* && groupadd -g 497 ecs-docker && usermod -a -G ecs-docker jenkins
USER jenkins

# HTTPS
#COPY https.pem /var/lib/jenkins/cert
#COPY https.key /var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#EXPOSE 8083