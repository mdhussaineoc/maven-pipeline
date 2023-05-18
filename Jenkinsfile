pipeline {
    agent any
    environment {
        IMAGE='centos'
        TAG='nginx'
    }
    stages {
        stage('creating a custom webpage') {
            steps {
                    sh """echo -e "welcome to jenkins learning" > index.html"""
                }
          }
        stage('Build') {
            steps {
                sh "docker build -t ${IMAGE}:${TAG} ."
            }
        }
        stage('run a container'){
            steps{
                sh"docker container run --name web-nginx -dit centos:nginx"
            }
        }
      stage('access the webserver'){
        steps{
          sh "curl 172.17.0.2"
        }
      }
   }
}
