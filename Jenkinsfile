pipeline {
    agent {
        label 'jenkins-node'
    }
    tools {
        jdk 'Java17'
        maven 'maven3'
    }
    stages {
        stage('Cleanup workspace') {
            steps {
                cleanWs()
            }

        }

        stage('Checkout from SCM') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/sudo-danish/complete-prodcution-e2e-pipeline.git'
            }
        }

        stage('Build & Test Application') {
            steps {
                sh 'mvn clean package'
                sh 'mvn test'
            }
        }
    }
}
