def name = 'project-deploy-qa'
job("${name}") {
    triggers {
        scm('* * * * *')
    }
    steps {
        shell(readFileFromWorkspace('seed', 'scripts/deploy-qa.sh'))
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
    }
}
