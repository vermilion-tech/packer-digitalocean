pipeline {
  agent { docker { image 'kadenlnelson/packer-ansible:latest' } }

  environment {
    DIGITALOCEAN_API_TOKEN = credentials('digitalocean-pat')
  }

  stages {
    stage('Packer Version') {
      steps {
        sh 'packer --version'
      }
    }
  }
}
