pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
				// build maven project
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
				// run unit tests
                sh 'mvn test'
            }
            post {
                success {
					// publish unit tests
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        stage('Publish') {
            steps {
				// publish code coverage report
                jacoco()
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
		}
        success {
        	// clean workspace
            cleanWs()
        }
    }
}