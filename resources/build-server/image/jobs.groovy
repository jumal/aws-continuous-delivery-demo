def project = 'project'
job("${project}") {
    triggers {
        scm('H/5 * * * *')
    }
    steps {
        shell('mvn clean package')
    }
    logRotator(-1, 5)
    concurrentBuild()
    configure {
        // for playground, use (it / scm).attributes['class'] = ...
        (it / scm).@class = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
        it / scm << {
            clearWorkspace 'true'
            projectName "${project}"
            actionTypeCategory 'Build'
            actionTypeProvider "jenkins-${project}"
            actionTypeVersion '1'
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
    }
}
