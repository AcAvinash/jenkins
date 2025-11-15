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


pipeline {
    agent { label 'AGENT-1' }
    
    environment {
        COURSE_NAME = 'Jenkins Basics'
    }

    stages {
        stage('Build') {
            steps {
               script {
                   sh """
                     echo "Building ${env.COURSE_NAME}..."
                     env
                   """
               }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Testing...'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying...'
                }
            }
        }
    }

    post {
        always {
            echo 'This will always run after the stages.'
            deleteDir()
        }
        success {
            echo 'This will run only if the pipeline succeeds.'
        }
        failure {
            echo 'This will run only if the pipeline fails.'
        }
    }
}
