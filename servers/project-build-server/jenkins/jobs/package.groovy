def name = 'project-package'
job("${name}") {
    triggers {
        scm('* * * * *')
    }
    steps {
        shell(readFileFromWorkspace('seed', 'scripts/package.sh'))
    }
    logRotator(-1, 5)
    concurrentBuild()
    configure {
        (it / scm).@class = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
        it / scm << {
            clearWorkspace 'true'
            projectName "${name}"
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
