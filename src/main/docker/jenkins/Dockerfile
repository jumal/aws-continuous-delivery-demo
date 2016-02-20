FROM jenkins

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Create users
COPY users.groovy /usr/share/jenkins/ref/init.groovy.d

# Create jobs
COPY jobs.groovy /usr/share/jenkins/ref/init.groovy.d

# Configure HTTPS
#COPY https.pem /var/lib/jenkins/cert
#COPY https.key /var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#EXPOSE 8083