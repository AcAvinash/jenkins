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
    agent  {
        label 'AGENT-1'
    }
    environment { 
        COURSE = 'jenkins'
    }
    options {
        timeout(time: 30, unit: 'MINUTES') 
        disableConcurrentBuilds()
    }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password') 
    }
    // Build
    stages {
        stage('Build') {
            steps {
                script{
                    sh """
                        echo "Hello Build"
                        sleep 10
                        env
                        echo "Hello ${params.PERSON}"
                    """
                }
            }
        }
        stage('Test') {
            steps {
                script{
                    echo 'Testing..'
                }
            }
        }
        stage('Deploy') {
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
            steps {
                script{
                    echo "Hello, ${PERSON}, nice to meet you."
                    
                    echo 'Deploying..'
                }
            }
        }
        
    }

    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'Hello Success'
        }
        failure { 
            echo 'Hello Failure'
        }
    }
}
