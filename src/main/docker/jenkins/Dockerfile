FROM jenkins

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Create users
COPY users.groovy /usr/share/jenkins/ref/init.groovy.d

# Create jobs
COPY seed.groovy /usr/share/jenkins/ref/init.groovy.d
COPY seed.xml jobs.groovy /tmp/seed/
USER root
RUN chown -R jenkins:jenkins /tmp/seed
USER jenkins

# Configure HTTPS
#COPY https.pem /var/lib/jenkins/cert
#COPY https.key /var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#EXPOSE 8083