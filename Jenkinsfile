pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh 'docker login -u ${DOCKERHUB_USER} -p $DOCKERHUB_PASSWORD'
      }
    }
  }
  environment {
    DOCKERHUB_USER = 'atarax'
  }
}