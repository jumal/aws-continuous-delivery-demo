FROM sonarqube

# Memory
ENV WEB_JAVA_OPTS="-Xmx768m -Xms256m -XX:MaxPermSize=160m -XX:+HeapDumpOnOutOfMemoryError -Djava.net.preferIPv4Stack=true" \
    SEARCH_JAVA_OPTS="-Xmx1G -Xms256m -Xss256k -Djava.net.preferIPv4Stack=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError"
RUN sed -i 's|console=true|console=true -Dsonar.web.javaOpts="$WEB_JAVA_OPTS" -Dsonar.search.javaOpts="$SEARCH_JAVA_OPTS"|g' $SONARQUBE_HOME/bin/run.sh

# Authentication
RUN echo -n '\nsonar.forceAuthentication=true' >> $SONARQUBE_HOME/conf/sonar.properties

# Password
ENV ADMIN_PASSWORD admin
RUN sed -i 's|set -e|set -e \&\& ENCRYPTED=$(echo -n "--48bc4b0d93179b5103fd3885ea9119498e9d161b--$ADMIN_PASSWORD--" \| openssl sha1 \| awk '"'"'{print $NF}'"'"') \&\& sed -i "s/a373a0e667abb2604c1fd571eb4ad47fe8cc0878/$ENCRYPTED/g" $SONARQUBE_HOME/web/WEB-INF/db/migrate/011_create_administrator.rb|g' $SONARQUBE_HOME/bin/run.sh

# Plugins
RUN curl -sLo $SONARQUBE_HOME/lib/bundled-plugins/sonar-build-breaker-plugin-2.0.jar \
	https://github.com/SonarQubeCommunity/sonar-build-breaker/releases/download/2.0/sonar-build-breaker-plugin-2.0.jar
