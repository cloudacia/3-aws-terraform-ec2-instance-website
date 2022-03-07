pipeline {
    agent any

    parameters {

        booleanParam(name: 'destroy',
                    defaultValue: false,
                    description: 'Destroy Terraform build?')
    }

     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        INFRACOST_API_KEY     = credentials('INFRACOST_API_KEY')
    }

    stages {
        stage('checkout') {
            steps {
              git "https://github.com/cloudacia/3-aws-terraform-ec2-instance-website.git"
              }
            }

        stage('init') {
            steps {
                sh 'terraform init -input=false -no-color'
            }
        }

        stage('validate') {
          steps{
            sh 'terraform validate -no-color'
          }
        }

        stage('tfsec') {

          steps {
            sh 'docker pull aquasec/tfsec:latest'
            sh 'docker run --rm -v "$(pwd):/src" aquasec/tfsec /src -e aws-vpc-no-public-ingress-sgr,aws-vpc-no-public-egress-sgr,aws-ec2-enforce-http-token-imds --no-color'
          }
        }

        stage('plan') {
          steps{
            sh 'terraform plan -input=false -out tfplan -lock=false -no-color'
          }
        }

        stage('apply') {
          steps{
            sh 'terraform apply -auto-approve -no-color'
          }
        }

        stage('infracos') {
          steps {
            sh 'docker pull infracost/infracost'
            sh 'docker run -v "$(pwd):/src" -e INFRACOST_API_KEY=${INFRACOST_API_KEY} infracost/infracost breakdown --path /src'
          }
        }

        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }

        steps {
           sh "terraform destroy --auto-approve -no-color"
          }
        }
      }
    }
