import jenkins.model.*

def tmp = new File('/tmp/seed')
Jenkins.instance.createProjectFromXML('seed', new FileInputStream(tmp.getPath() + '/seed.xml'))
def workspace = new File('/var/jenkins_home/workspace/seed')
workspace.mkdirs()
new File(workspace, 'jobs.groovy').bytes = new File(tmp, 'jobs.groovy').bytes
tmp.deleteDir()