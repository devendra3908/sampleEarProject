#!groovy

pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
     stage('Docker Build image for Operating System') {
      agent any
      steps {
        sh "docker build -t devendra3908/ubuntujava8tomcat:latest --build-arg JDK-VERSION='${params.JDK}' --build-arg TOMCAT-MAJOR='${params.TOMCAT-MAJOR}' --build-arg UBUNTU-VERSION=$'{params.UBUNTU}' --build-arg TOMCAT-VERSION='${params.TOMCAT}' ."
      }
    }
  }
}
