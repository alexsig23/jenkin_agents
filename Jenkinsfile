pipeline {
    agent any
environment {
    withCredentials([file(credentialsId: 'alexgaskell-sandbox', variable: 'GC_KEY')]) {
    sh("gcloud auth activate-service-account --key-file=${GC_KEY}")
    sh("gcloud container clusters get-credentials prod --zone europe-west2-b --project ${project}")
  }
}
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
                 sh 'terraform apply --auto-approve'
            }
        }
        stage('Terraform Destroy') {
            steps {
                 sh 'terraform destroy --auto-approve'
                 echo 'Created, Destroyed..'
            }        
        }
	}
}