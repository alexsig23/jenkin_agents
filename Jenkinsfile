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
                 sh 'terraform init -input=false'
            }
        }
        stage('Terraform Apply') {
            steps {
                 sh 'terraform plan'
                 sh 'terraform apply -y'
            }
        }
        stage('Terraform Destroy') {
            steps {
                 sh 'terraform destroy -y'
                 echo 'Created, Destroyed..'
            }        
        }
	}
}