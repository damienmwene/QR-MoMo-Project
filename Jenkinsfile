pipeline {
    agent any
    tools {
      maven 'Apache Maven 3.9.8'
    }  
    
    triggers {
         pollSCM '* * * * *'
    }
    environment {
        CI = false          // do not treat warnings as errors
    }
    stages {
        stage('dockerizing') {
            steps {
             withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 sh 'docker login -u $USERNAME -p $PASSWORD'
    // Your Docker commands using the environment variables
                 sh 'docker build -t qrmomojenk:${BUILD_NUMBER} .'
                sh 'docker tag qrmomojenk:${BUILD_NUMBER} mwene/qrmomojenk:v1'
                sh 'docker push mwene/qrmomojenk:v1'
             }
            } 
        }         
    }    
}
