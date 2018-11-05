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
               sh 'mv target/muletesting.jar helloworld.jar'
    }
}  
stage("Buildimg") {
steps { 
	
	buildApp() }
}
stage("Deploy") {
  steps { deploy() 
	  
	}
}
}
}
// steps
def buildsrc() {
dir ('.' ) {
    sh '/app/ciplatform/apache-maven-3.3.9/bin/mvn clean install'
}
}
def buildApp() {
dir ('' ) {
def appImage = docker.build("eaiesbhub/mule-4:${BUILD_NUMBER}")
}
}
def deploy() {
	def containerName = 'mule-4'
	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d --name ${containerName} eaiesbhub/mule-4:${BUILD_NUMBER}"
}
