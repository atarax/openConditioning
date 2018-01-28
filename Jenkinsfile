pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {
    stage('build') {
      steps {
        sh 'docker login -u \'$test\' -p \'$test\''
      }
    }
  }
}