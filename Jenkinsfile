pipeline {
    agent none
    
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
        stage('Test') { 
            steps {
                sh 'echo "Test"'
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
