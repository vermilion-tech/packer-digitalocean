pipeline {
  agent { docker { image 'kadenlnelson/packer-ansible:latest' } }

  environment {
    COMMIT_MESSAGE = """${sh(
      returnStdout: true,
      script: "git --no-pager log --format='medium' -1 ${GIT_COMMIT}"
    )}"""

    PACKER_LOG=1
  }

  stages {
    stage('Notify Slack') {
        steps {
            slackSend(color: '#000000', message: "Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)\n```${env.COMMIT_MESSAGE}```")
        }
    }

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
        withCredentials([string(credentialsId: 'packer-digitalocean-token', variable: 'DIGITALOCEAN_API_TOKEN')]) {
          sh 'packer validate images/ubuntu/base.json'
        }
      }
    }

    stage('Building vermilion-ubuntu-base') {
      steps {
        slackSend (color: '#1aaeff', message: "Building vermilion-ubuntu-base")
        withCredentials([string(credentialsId: 'packer-digitalocean-token', variable: 'DIGITALOCEAN_API_TOKEN')]) {
          sh 'packer build images/ubuntu/base.json > build.log'
        }
        script {
          BUILD_STATUS = sh(script: 'tail -n 2 build.log', returnStdout: true)
        }
        slackSend (color: '#bae7ff', message: "```${BUILD_STATUS}```")
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
