FROM sonarqube

# JAVA_OPTS
ENV JAVA_OPTS -Xmx768m
RUN sed -i 's|console=true|console=true -Dsonar.web.javaOpts="$WEB_JAVA_OPTS" -Dsonar.search.javaOpts="$SEARCH_JAVA_OPTS"|g' $SONARQUBE_HOME/bin/run.sh

# Plugins
#RUN rm $SONARQUBE_HOME/lib/bundled-plugins/sonar-java-plugin-*.jar && \
#    rm $SONARQUBE_HOME/extensions/plugins/sonar-java-plugin-*.jar && \
#    curl -so $SONARQUBE_HOME/extensions/plugins/sonar-java-plugin-3.11.jar \
#	 https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-3.11.jar
