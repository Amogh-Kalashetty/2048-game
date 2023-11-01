pipeline {
    agent any

    stages {
        stage('Code') {
            steps {
                git 'https://github.com/Amogh-Kalashetty/2048-game.git'
            }
        }
        stage('Build & Deploy') {
            steps {
                sh 'docker build . -t 2048-game'
                sh 'docker run -d -p 80:80 2048-game:latest'
            }
        }
    }
}
