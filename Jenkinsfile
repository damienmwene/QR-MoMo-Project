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
        stage('Maven Build') {
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/damienmwene/QR-MoMo-Project.git/']])
                sh 'mvn clean install'
            }
        }
        
        stage('dockerizing') {
            steps {
             withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 sh 'docker login -u $USERNAME -p $PASSWORD'
    // Your Docker commands using the environment variables
                 sh 'docker build -t qrmomojenk:v1 .'
                sh 'docker tag qrmomojenk:v1 mwene/qrmomojenk:v1'
                sh 'docker push mwene/qrmomojenk:v1'
             }
            } 
        }         
    }    
}
