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
        sh 'docker build -t devendra3908/ubuntujava8tomcat:latest --build-arg JDK-VERSION=${caller.env.JDK-VERSION} --build-arg TOMCAT-MAJOR=${caller.env.TOMCAT-MAJOR} --build-arg UBUNTU-VERSION=${caller.env.UBUNTU-VERSION} --build-arg TOMCAT-VERSION=${caller.env.TOMCAT-VERSION} .'        
      }
    }
  }
}
