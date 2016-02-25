import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

// Create user
def username = "admin"
def password = "secret"
def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount(username, password)
instance.setSecurityRealm(realm)
def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(Jenkins.ADMINISTER, username)
instance.setAuthorizationStrategy(strategy)
instance.save()

// Create seed project
def source = new File('/tmp/seed')
instance.createProjectFromXML('seed', new FileInputStream(source.getPath() + '/seed.xml'))
def workspace = new File('/var/jenkins_home/workspace/seed')
workspace.mkdirs()
new File(workspace, 'jobs.groovy').bytes = new File(source, 'jobs.groovy').bytes
source.deleteDir()
