def project = 'project-deploy-to-qa'
job("${project}") {
    triggers {
        scm('* * * * *')
    }
    steps {
        shell(readFileFromWorkspace('seed', 'scripts/deploy.sh'))
    }
    logRotator(-1, 5)
    concurrentBuild()
    configure {
        (it / scm).@class = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
        it / scm << {
            clearWorkspace 'true'
            projectName "${project}"
            actionTypeCategory 'Test'
            actionTypeProvider 'project-jenkins'
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
