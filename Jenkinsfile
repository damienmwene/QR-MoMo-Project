pipeline {
    agent any  
    
    triggers {
         pollSCM '* * * * *'
    }
    environment {
        CI = false          // do not treat warnings as errors
    }
    stages {  
        stage('Dockerizing') {
            steps {
             withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 sh 'docker login -u $USERNAME -p $PASSWORD'
    // Your Docker commands using the environment variables
                 sh 'docker build -t qrmomojenk:v2 .'
                sh 'docker tag qrmomojenk:v2 mwene/qrmomojenk:v2'
                sh 'docker push mwene/qrmomojenk:v2'
             }
            } 
        }         
    }    
}
