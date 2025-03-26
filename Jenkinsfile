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
                sh  'python3 -m robot -d results tests/login_avec_template_data.robot'
            }
        }

    }

post {
    always {
                    // Note! Careful not to mix the Jenkins robot step with the robot command run inside the previous
                    // sh step! The robot step only publishes the results for Jenkins and the robot command
                    // inside sh step runs the tests!
                    robot(
                        outputPath          : 'results',
                        outputFileName      : "output.xml",
                        reportFileName      : 'report.html',
                        logFileName         : 'log.html',
                        disableArchiveOutput: false,
                        passThreshold       : 95.0,
                        unstableThreshold   : 95.0,
                        otherFiles          : "*/.png",
                    )
                }
            }
}
