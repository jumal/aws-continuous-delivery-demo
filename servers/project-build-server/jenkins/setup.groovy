import jenkins.model.*
import hudson.security.*
import hudson.plugins.sonar.*
import hudson.plugins.sonar.model.*
import hudson.tools.*

def instance = Jenkins.getInstance()

// Create user
def username = 'admin'
def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount(username, System.getenv()['ADMIN_PASSWORD'])
instance.setSecurityRealm(realm)
def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(Jenkins.ADMINISTER, username)
instance.setAuthorizationStrategy(strategy)

// Set executors number
instance.setNumExecutors(1)
instance.save()

// Create seed project
def source = new File('/tmp/jobs')
instance.createProjectFromXML('seed', new FileInputStream(source.getPath() + '/seed.xml'))
new AntBuilder().copy(todir:'/var/jenkins_home/workspace/seed') {
    fileset(dir:source.getPath())
}
source.deleteDir()
for (File script : new File('/var/jenkins_home/workspace/seed/scripts').listFiles()) script.setExecutable(true)

// Install maven
def mavenPluginExtension = Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0]
def asList = (mavenPluginExtension.installations as List)
asList.add(new hudson.tasks.Maven.MavenInstallation('(Default)', null, [new hudson.tools.InstallSourceProperty([new hudson.tasks.Maven.MavenInstaller("3.3.9")])]))
mavenPluginExtension.installations = asList
mavenPluginExtension.save()

// Install sonarqube
def sonarPluginDescriptor = instance.getDescriptor("hudson.plugins.sonar.SonarPublisher")
def sonarInstallation = new SonarInstallation("sonarqube", false, "http://sonarqube:9000", "", "", "", "", "", new TriggersConfig(), "", "", "")
sonarPluginDescriptor.setInstallations(sonarInstallation)
sonarPluginDescriptor.setBuildWrapperEnabled(true)
sonarPluginDescriptor.save()
def sonarRunnerInstallationDescriptor = instance.getDescriptor("hudson.plugins.sonar.SonarRunnerInstallation")
def sonarRunnerInstaller = new SonarRunnerInstaller("2.5")
def property = new InstallSourceProperty([sonarRunnerInstaller])
def sonarRunnerInstallation = new SonarRunnerInstallation("Default", "", [property])
sonarRunnerInstallationDescriptor.setInstallations(sonarRunnerInstallation)
sonarRunnerInstallationDescriptor.save()
