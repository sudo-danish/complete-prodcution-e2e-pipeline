pipeline {
    agent {
        label 'jenkins-node'
    }
    tools {
        jdk 'Java17'
        maven 'maven3'
    }
    environment {
        APP_NAME = "complete-prodcution-e2e-pipeline"
        RELEASE = "1.0"
        DOCKER_USER = "danishlxc"
        DOCKER_PASS = credentials('dockerhub')
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"

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

        stage('Sonarqube Analysis') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }

        
        stage('Build & Push Docker Image') {
            steps{
                script {
                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image = docker.build("${IMAGE_NAME}")
                    }

                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                    }
                }
            }
        }
    }
}
