// def remote = [:]
// remote.name = "buildserver"
// remote.host = "192.168.56.111"
// remote.allowAnyHosts = true
//
// def remoteDirectory = "./jenkins-ws/${env.JOB_NAME}"
// def privateRegistry = "10.1.5.151:32000"
// def dockerImageName = "${privateRegistry}/${env.JOB_NAME}"
//
// pipeline {
//     agent any
//
//     options {
//         disableConcurrentBuilds()
//     }
//
//     stages {
//
//         stage("Stop Kubernetes Deployment") {
//             steps {
//                 sh "microk8s kubectl delete -f deployment.yaml || true"
//                 sh "microk8s ctr images rm localhost:32000/${env.JOB_NAME}:registry"
//             }
//         }
//
//         stage("Build Docker Image") {
//             steps {
//                 script {
//                     withCredentials([sshUserPrivateKey(credentialsId: 'buildserverCredentialsID', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'vmadmin')]) {
//                         remote.user = vmadmin
//                         remote.identityFile = identity
//
//                         echo "Delete previous source in ${remote.name}"
//                         sshCommand remote: remote,
//                         failOnError: false,
//                         command: "rm -r ${remoteDirectory}"
//
//                         echo "Copy new source to ${remote.name}"
//                         sshPut remote: remote,
//                         from: '.',
//                         into: './jenkins-ws'
//
//                         echo "Build and tag docker image in ${remote.name}"
//                         sshCommand remote: remote,
//                         command: "( cd ${remoteDirectory} ; docker build -t ${dockerImageName}:registry . )"
//
//                         echo "Push docker image to ${privateRegistry}"
//                         sshCommand remote: remote,
//                         command: "( cd ${remoteDirectory} ; docker push ${dockerImageName} )"
//                     }
//                 }
//             }
//         }
//
//         stage("Start Kubernetes Deployment") {
//             steps {
//                 sh "microk8s kubectl apply -f deployment.yaml"
//             }
//         }
//     }
//
//     post {
// 		always {
// 			// sending email along with build log
// 			emailext attachLog: true,
//                 body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
//                 recipientProviders: [developers(), requestor()],
//                 subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
//
//             // clean workspace
//             cleanWs()
// 		}
//     }
// }
// ---------------------------------------
pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {

        stage("Stop Deployment") {
            steps {
                sh "sudo docker-compose down"
            }
        }

        stage("Build Image") {
            steps {
                sh "sudo docker-compose build --force-rm"
            }
        }

        stage("Start Deployment") {
            steps {
                sh "sudo docker-compose up -d"
            }
        }
    }

    post {
		always {
			// sending email along with build log
			emailext attachLog: true,
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [developers(), requestor()],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"

            // clean workspace
            cleanWs()
		}
    }
}