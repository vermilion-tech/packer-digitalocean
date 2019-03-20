pipeline {
  agent { docker { image 'kadenlnelson/packer-ansible:latest' } }

  environment {
    DIGITALOCEAN_API_TOKEN = credentials('digitalocean-pat')
  }

  stages {
    stage('Install Dependencies') {
      steps {
        slackSend (color: '#282d34', message: "Installing Ansible Galaxy Requirements")
        sh 'ansible-galaxy install -r ansible/requirements.yml'
      }
    }


    stage('Linting / Validating') {
      steps {
        slackSend (color: '#8dd7ff', message: "Inspecting & Validating vermilion-ubuntu-base")
        sh 'packer inspect images/ubuntu/base.json'
        sh 'packer validate images/ubuntu/base.json'
      }
    }

    stage('Building vermilion-ubuntu-base') {
      steps {
        slackSend (color: '#1aaeff', message: "Building vermilion-ubuntu-base")
        sh 'packer build images/ubuntu/base.json'
      }
    }
  }

  post {
    failure {
      slackSend (color: '#FF0000', message: "Build Failed! - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)")
    }

    success {
      slackSend (color: '#00FF00', message: "Success! - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)")
    }
  }
}
