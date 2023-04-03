pipeline {

    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('checkout') {

            steps {

                echo 'check gitHub'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/Vitky2/Examle-one']]])

            }
        }

        stage('build') {

            steps {

                echo 'building'

            }
        }

        stage('test') {

            steps {

                echo 'testing'

            }
        }
    }
    post {
        success {
            echo 'done'
        }
    }
}
