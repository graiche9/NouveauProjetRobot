pipeline {
    agent {
        docker {
            image 'python:3.9-slim' 
            args '--user root'
        }
    }

    environment {
        ROBOT_DIR = 'tests'  
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                pip install --upgrade pip
                pip install robotframework
                pip install robotframework-datadriver
                pip install robotframework-seleniumlibrary
                '''
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                
                sh  'python3 -m robot tests/login_avec_template_data.robot'
               
            }
        }

        stage('Publish Test Results') {
            steps {
                //junit '**/output.xml'
                junit '**/results.xml'
                //archiveArtifacts artifacts: '**/report.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
