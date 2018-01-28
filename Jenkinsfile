pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh 'docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
        sh 'docker build -t ${REPOSITORY}/${WEBSERVER_IMAGE}:${GIT_COMMIT} app/nginx'
      }
    }
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    REPOSITORY = 'atarax'
    WEBSERVER_IMAGE = 'bodystats-nginx'
  }
}
