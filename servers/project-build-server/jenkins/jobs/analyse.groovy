def name = 'project-analyse'
job("${name}") {
    triggers {
        scm('* * * * *')
    }
    steps {
        maven('$SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_LOGIN -Dsonar.password=$SONAR_PASSWORD')
    }
    logRotator(-1, 5)
    concurrentBuild()
    configure {
        (it / scm).@class = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
        it / scm << {
            clearWorkspace 'true'
            projectName "${name}"
            actionTypeCategory 'Test'
            actionTypeProvider 'Jenkins'
            actionTypeVersion '2'
            region 'us-east-1'
            awsAccessKey ''
            awsSecretKey ''
            proxyHost ''
            proxyPort '0'
            awsClientFactory ''
        }
        it / publishers << 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelinePublisher' {
            buildOutputs ''
            awsClientFactory ''
        }
        it / buildWrappers << 'hudson.plugins.sonar.SonarBuildWrapper' {
        }
    }
}
