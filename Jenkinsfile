pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {

    stage('Build') {
      steps {
        sh 'docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
        sh 'docker build -t ${DOCKER_REPOSITORY}/${WEBSERVER_IMAGE}:${GIT_COMMIT} app/nginx'
        sh 'docker push ${DOCKER_REPOSITORY}/${WEBSERVER_IMAGE}'
      }
    }

    stage('Test') {
      steps {
        sh 'echo "tbd.."'
      }
    }

    stage('Deploy to Staging') {
      agent {
        docker {
          image 'atarax/kubernetes-toolbox'
        }
        
      }
      steps {
        sh 'mkdir /root/.kube'
        sh 'cat ${K8L_CONFIG} > /root/.kube/config'
        sh 'helm init --client-only'
        sh 'helm upgrade \
            --namespace="staging" \
            --set image.tag=${GIT_COMMIT} \
            ${HELM_RELEASE_NAME}-staging \
            app/helm/bodystats'
      }
    }

    stage('Manual Verification') {
      steps {
        input(message: 'Deploy to Production?', id: 'deploy_to_production')
      }
    }

    stage('Deploy to Production') {
      agent {
        docker {
          image 'atarax/kubernetes-toolbox'
        }

      }
      steps {
        sh 'mkdir /root/.kube'
        sh 'cat ${K8L_CONFIG} > /root/.kube/config'
        sh 'helm init --client-only'
        sh 'helm upgrade \
            --namespace="staging" \
            --set image.tag=${GIT_COMMIT} \
            ${HELM_RELEASE_NAME}-production \
            app/helm/bodystats'
      }
    }
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    K8L_CONFIG = credentials('k8l-config')
    DOCKER_REPOSITORY = 'atarax'
    WEBSERVER_IMAGE = 'bodystats-nginx'
    HELM_RELEASE_NAME = 'bodystats'
  }
}