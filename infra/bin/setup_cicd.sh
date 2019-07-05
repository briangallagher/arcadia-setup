echo "Configuring slave"

# oc new-build --name=jenkins-slave-maven-appdev -D $'FROM docker-registry.default.svc:5000/openshift/java:8\nUSER root\nRUN yum -y install skopeo\nUSER 1001' -n shared-jenkins


# oc new-build --name=jenkins-slave-maven-appdev -D $'FROM docker.io/openshift/jenkins-slave-maven-centos7:v3.9\nUSER root\nRUN yum -y install skopeo\nUSER 1001' -n $JENKINS_PROJECT

# oc new-build --name=jenkins-slave-maven-appdev -D $'FROM docker.io/openshift/jenkins-slave-maven-centos7:v3.9\nUSER root\nRUN yum -y install skopeo\nUSER 1001' -n shared-jenkins

oc tag openshift/java:8 shared-jenkins/java:8
oc tag openshift/java:8 shared-jenkins/java:latest

# configure kubernetes PodTemplate plugin.
oc new-app -f ../templates/jenkins-maven-agent.yml -n shared-jenkins

echo "Slave configured"