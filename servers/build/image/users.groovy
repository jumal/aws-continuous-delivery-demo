import jenkins.model.*
import hudson.security.*

def username = "admin"
def password = "secret"

def instance = Jenkins.getInstance()

def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount(username, password)
instance.setSecurityRealm(realm)

def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(Jenkins.ADMINISTER, username)
instance.setAuthorizationStrategy(strategy)

instance.save()
