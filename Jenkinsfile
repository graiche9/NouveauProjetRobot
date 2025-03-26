pipeline {
    agent {
        docker {
            image 'python:3.9-slim' 
            args '--user root'
        }
    }

    environment {
        ROBOT_DIR = 'tests'  // Directory containing your Robot Framework test files
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
                // Run Robot Framework with output file options
                sh  'python3 -m robot tests/login_avec_template_data.robot'
            }
        }

    }

    post {
        always {
            cleanWs()  // Clean workspace after pipeline execution
        }
    }
}
