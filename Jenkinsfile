pipeline {
    agent {
        docker { image 'node:14-alpine' }
    } 
    environment {
        registry = "tuanops/jenkins-docker"
        registryCredential = 'dockerhub'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'echo "Build"'
            }
        }
        stage('Test') { 
            steps {
                sh 'echo "Test"'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'echo "Deploy"'
            }
        }
    }
}
