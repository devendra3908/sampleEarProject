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
        sh 'docker build -t devendra3908/ubuntujava8tomcat:latest --build-arg JDK-VERSION=$JDK-VERSION --build-arg TOMCAT-MAJOR=$TOMCAT-MAJOR --build-arg UBUNTU-VERSION=$UBUNTU-VERSION --build-arg TOMCAT-VERSION=$TOMCAT-VERSION .'
      }
    }
  }
}
