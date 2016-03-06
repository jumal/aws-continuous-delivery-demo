def project = 'project-compile'
job("${project}") {
    triggers {
        scm('* * * * *')
    }
    steps {
        maven('clean package -DskipTests')
    }
    logRotator(-1, 5)
    concurrentBuild()
    configure {
        (it / scm).@class = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
        it / scm << {
            clearWorkspace 'true'
            projectName "${project}"
            actionTypeCategory 'Build'
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
            buildOutputs {
                'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelinePublisher_-OutputTuple' {
                    outputString ''
                }
            }
            awsClientFactory ''
        }
    }
}
