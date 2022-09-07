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
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy') { 
           steps{
                script {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
