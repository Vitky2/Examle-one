pipeline {

    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('checkout') {

            steps {

                echo 'check gitHub'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/Vitky2/Examle-one']]])

            }
        }

        stage('build') {

            steps {

                echo 'building'
                sh 'docker build -t test:latest .'
                sh 'docker run --rm -d -p 8000:8000 test'

            }
        }

        
        stage('test') {

            steps {

                echo 'testing'
                sh 'sleep 60'
                sh 'curl -d "num1=5&num2=10" -X POST http://localhost:8000/add'
                sh 'docker stop $(docker ps -q --filter ancestor=test)' 
                
            }
        }

        stage('sast') {
            
            steps {

                echo 'sast runing'
                sh 'docker run test:latest bandit -r APIcalc.py'
                
            }
        }

    }
    post {
        success {
            echo 'done :)'
        }
        failure {
            echo 'not done :('
        }
    }
}
