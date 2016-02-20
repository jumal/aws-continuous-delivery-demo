def project = 'project'
job("${project}") {
    triggers {
        scm('H/5 * * * *')
    }
    concurrentBuild()
    configure {
        (it / scm).attributes['class'] = 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelineSCM'
//        (it / scm).attributes['plugin'] = 'aws-codepipeline@0.11'
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
        it / builders << 'hudson.tasks.Shell' {
            command 'mvn clean package'
        }
        it / publishers << 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelinePublisher' {
//            it / publishers << 'com.amazonaws.codepipeline.jenkinsplugin.AWSCodePipelinePublisher' (plugin:"aws-codepipeline@0.11") {
            buildOutputs ''
            awsClientFactory ''
        }
    }
}
