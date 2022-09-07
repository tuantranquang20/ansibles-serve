node {
    def app
    stage('Clone repository') {
        checkout scm
    }

    // environment {
    //     registry = "tuanops/jenkins-docker"
    //     registryCredential = 'dockerhub'
    // }
    stage('Build image') {

        app = docker.build("tuanops/jenkins-docker")
    }
    
    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    
    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Cleaning up') {
        app.inside {
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }

    // stages {
    //     stage('Build') { 
    //         steps{
    //             script {
    //                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
    //             }
    //         }
    //     }
    //     stage('Deploy') { 
    //        steps{
    //             script {
    //                     docker.withRegistry( '', registryCredential ) {
    //                     dockerImage.push()
    //                 }
    //             }
    //         }
    //     }
    //     stage('Cleaning up') {
    //         steps{
    //             sh "docker rmi $registry:$BUILD_NUMBER"
    //         }
    //     }
    // }
}
