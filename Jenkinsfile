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
        sh 'docker build -t devendra3908/ubuntujava8tomcat:latest --build-arg JDK-VERSION=${env.JDK-VERSION} --build-arg TOMCAT-MAJOR=${env.TOMCAT-MAJOR} --build-arg UBUNTU-VERSION=${env.UBUNTU-VERSION} --build-arg TOMCAT-VERSION=${env.TOMCAT-VERSION} .'
      }
    }
  }
}
