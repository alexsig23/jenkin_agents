pipeline {
    agent any
 stages {
        stage('Start') {
            steps {
                echo 'Hello World on Development Branch'
            }
      	}
        stage('Terraform Init') {
            steps {
                 sh 'terraform init .'
                 sh 'terraform plan'
            }
        }
	}
}
