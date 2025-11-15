// pipeline {
//     agent any
//     stages {
//         stage('Build') {
//             steps {
//                echo 'Building...'
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Testing...'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying...'
//             }
//         }
//     }
// }

// Example-2
// pipeline {
//     agent { label 'AGENT-1' }
//     stages {
//         stage('Build') {
//             steps {
//                echo 'Building...'
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Testing...'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying...'
//             }
//         }
//     }

//     post {
//         always {
//             echo 'This will always run after the stages.'
//             deleteDir()
//         }
//         success {
//             echo 'This will run only if the pipeline succeeds.'
//         }
//         failure {
//             echo 'This will run only if the pipeline fails.'
//         }
//     }
// }

// Example-3
// pipeline {
//     agent { label 'AGENT-1' }
    
//     environment {
//         COURSE_NAME = 'Jenkins Basics'
//     }

//     stages {
//         stage('Build') {
//             steps {
//                script {
//                    sh """
//                      echo "Building ${env.COURSE_NAME}..."
//                      env
//                    """
//                }
//             }
//         }
//         stage('Test') {
//             steps {
//                 script {
//                     echo 'Testing...'
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 script {
//                     echo 'Deploying...'
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             echo 'This will always run after the stages.'
//             deleteDir()
//         }
//         success {
//             echo 'This will run only if the pipeline succeeds.'
//         }
//         failure {
//             echo 'This will run only if the pipeline fails.'
//         }
//     }
// }

// Example-4
// pipeline {
//     agent { label 'AGENT-1' }
    
//     environment {
//         COURSE_NAME = 'Jenkins Basics'
//     }

//     options {
//         timeout(time: 1, unit: 'SECONDS')

//     }

//     stages {
//         stage('Build') {
//             steps {
//                script {
//                    sh """
//                      echo "Building ${env.COURSE_NAME}..."
//                      env
//                    """
//                }
//             }
//         }
//         stage('Test') {
//             steps {
//                 script {
//                     echo 'Testing...'
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 script {
//                     echo 'Deploying...'
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             echo 'This will always run after the stages.'
//             deleteDir()
//         }
//         success {
//             echo 'This will run only if the pipeline succeeds.'
//         }
//         failure {
//             echo 'This will run only if the pipeline fails.'
//         }
//     }
// }

//Example-5: withouth DisableConcurrentBuilds
// pipeline {
//     agent any

//     stages {
//         stage('Demo') {
//             steps {
//                 echo "Build Started: #${env.BUILD_NUMBER}"
//                 sh """
//                     echo "Simulating long work..."
//                     sleep 30
//                     echo "Build Finished: #${env.BUILD_NUMBER}"
//                 """
//             }
//         }
//     }
// }
// Example-6: with DisableConcurrentBuilds

// pipeline {
//     agent any

//     options {
//         disableConcurrentBuilds()
//     }

//     stages {
//         stage('Demo') {
//             steps {
//                 echo "Build Started: #${env.BUILD_NUMBER}"
//                 sh """
//                     echo "Simulating long work..."
//                     sleep 30
//                     echo "Build Finished: #${env.BUILD_NUMBER}"
//                 """
//             }
//         }
//     }
// }

// Example-7: with parameters
pipeline {
    agent any

    parameters {

        // String Param
        string(
            name: 'USERNAME',
            defaultValue: 'avinash',
            description: 'Enter your username'
        )

        // Boolean Param
        booleanParam(
            name: 'RUN_TESTS',
            defaultValue: true,
            description: 'Run tests or skip?'
        )

        // Choice Param
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'qa', 'stage', 'prod'],
            description: 'Choose deployment environment'
        )

        // Password Param
        password(
            name: 'USER_PASSWORD',
            defaultValue: '',
            description: 'Your password'
        )

        // Text Param (multi-line)
        text(
            name: 'DESCRIPTION',
            defaultValue: 'This is a multi-line text',
            description: 'Add notes'
        )
    }

    stages {
        stage('Show All Params') {
            steps {
                script {
                    echo "Username: ${params.USERNAME}"
                    echo "Run Tests?: ${params.RUN_TESTS}"
                    echo "Environment Selected: ${params.ENVIRONMENT}"
                    echo "Description: ${params.DESCRIPTION}"

                    // Password should NOT be printed, for safety
                    echo "Password captured (not showing for security): YES"
                }
            }
        }

        stage('Conditional Test Stage') {
            when {
                expression { params.RUN_TESTS == true }
            }
            steps {
                echo "Running tests because RUN_TESTS = true"
            }
        }

        stage('Deploy Stage') {
            steps {
                echo "Deploying to ${params.ENVIRONMENT} environment"
            }
        }
    }
}

