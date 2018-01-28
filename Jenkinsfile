pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh '''docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}
docker build -t ${DOCKER_REPOSITORY}/${WEBSERVER_IMAGE}:${CI_COMMIT_REF_NAME} app/nginx
docker push ${DOCKER_REPOSITORY}/${WEBSERVER_IMAGE}'''
      }
    }
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    DOCKER_REPOSITORY = 'atarax'
    WEBSERVER_IMAGE = 'bodystats-nginx'
  }
}