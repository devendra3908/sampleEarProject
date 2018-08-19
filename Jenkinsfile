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
	  echo "${params.JDK}"
          echo "${params.TOMCAT_MAJOR}"
          echo "${params.UBUNTU}"
          echo "${params.TOMCAT}"
        sh "docker build -t devendra3908/ubuntujava8tomcat:latest --build-arg jdkversion=${params.JDK} --build-arg tomcatmajor=${params.TOMCAT_MAJOR} --build-arg ubuntuversion=${params.UBUNTU} --build-arg tomcatversion=${params.TOMCAT} ."
      }
    }
  }
}
