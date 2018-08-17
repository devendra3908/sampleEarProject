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
    stage('Docker Build image') {
      agent any
      steps {
        sh 'docker build -t devendra3908/SampleEarProject:latest .'
      }
    } 
    stage('Docker Pull Image') {
      agent any
      steps {
        sh 'docker pull ubuntu:18.04'
        sh 'docker run -i -t ubuntu:18.04 /bin/bash'
      }
    }
  }
}
