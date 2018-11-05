#!/usr/bin/groovy
pipeline {
    environment {
        JAVA_HOME = tool('java')
    }
agent any
options {
disableConcurrentBuilds()
}
stages {
  
stage("buildsrc") {
steps { buildsrc() }
}
stage('renaming the target zip file') {
    steps {
               sh 'mv target/helloworld-1.0.0-SNAPSHOT-mule-application.jar helloworld.jar'
    }
}  
stage("Buildimg") {
steps { 
	slackSend (message: 'Building the image')
	buildApp() }
}
stage("Deploy") {
  steps { deploy() 
	  slackSend (message: 'container deployed sucessfully')
	}
}
}
}
// steps
def buildsrc() {
dir ('.' ) {
    sh '/usr/maven/apache-maven-3.3.9/bin/mvn clean install'
}
}
def buildApp() {
dir ('' ) {
def appImage = docker.build("eaiesbhub/mule4-helloworld:${BUILD_NUMBER}")
}
}
def deploy() {
	def containerName = 'mule4-helloworld'
	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d --name ${containerName} eaiesbhub/mule4-heeloworld:${BUILD_NUMBER}"
}
