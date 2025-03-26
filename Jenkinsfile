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
                sh '''
                sh 'python3 -m robot --output output.xml --log log.html --report report.html tests/login_avec_template_data.robot'

                '''
            }
        }

        stage('Publish Test Results') {
            steps {
                // Publish JUnit results from the generated results.xml
                junit '**/output.xml'

                // Archive the Robot Framework HTML report and log for debugging
                archiveArtifacts artifacts: '**/report.html, **/log.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean workspace after pipeline execution
        }
    }
}
