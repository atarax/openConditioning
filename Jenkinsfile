pipeline {
  agent {
    docker {
      image 'docker'
      args '-it'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh 'docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
      }
    }
  }
  environment {
    DOCKERHUB_CREDENTIALS = 'credentials(\'dockerhub_credentials\')'
  }
}