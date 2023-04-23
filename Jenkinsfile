def branch = "main"
def remote = "origin"
def dir = "~/wayshub-backend"
def server = "anba@103.189.235.54"
def credi = "appserver"

pipeline {
	agent any
	stages {
		stage ('Pull From Git'){
			steps{
				sshagent ([credi]) {
					sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
					cd ${dir}
					git pull ${remote} ${branch}
					exit
					EOF"""
				}
			}
		}
	

                stage ('docker build'){
                        steps{
                                sshagent ([credi]) {
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        cd ${dir}
                                        docker build -t wayshub-be .
                                        exit
                                        EOF"""
                                }
                        }
                }
        

                stage ('docker run'){
                        steps{
                                sshagent ([credi]) {
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        cd ${dir}
                                        docker run -d -p 5000:5000 wayshub-be
                                        exit
                                        EOF"""
                                }
                        }
                }
        
                stage ('docker push'){
                        steps{
                                sshagent ([credi]) {
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        cd ${dir}
					docker tag wayshub-be:latest angellaviory/wayshub-backend:latest
                                        docker push angellaviory/wayshub-backend:latest
                                        exit
                                        EOF"""
                                }
                        }
                }	
	}
}
