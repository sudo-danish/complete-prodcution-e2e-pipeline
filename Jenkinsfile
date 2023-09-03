pipeline {
    agent {
        label 'jenkins-agent'
    }
    tools {
        jdk 'Java17'
        maven 'maven3'
    }
    stages {
        stage('Cleanup workspace') {
            steps {
                cleanws()
            }

        }

        stage('Checkout from SCM') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/sudo-danish/complete-prodcution-e2e-pipeline.git'
            }
        }
    }
}
