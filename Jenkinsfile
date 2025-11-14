pipeline{
	agent any

	environment {
		IMAGE_NAME = "janithad/spring-todo-app"
	}

	stages {

		stage('Pull Docker Image') {
			steps {
				script {
					retry(5) {
						echo "Trying to pull Docker image..."
						sh "docker pull ${IMAGE_NAME}:${GIT_COMMIT}"
					}
				}
			}
		}

		stage('Load Image into Minikube') {
			steps {
				script {
					echo "Loading Image into Minikube..."
					sh "minikube image load ${IMAGE_NAME}:${GIT_COMMIT}"
				}
			}
		}

		stage('Deploy Kubernetes Manifests'){
			steps {
				script {
					echo "Applying Kubernetes manifests from k8s/ folder..."
					sh "kubectl apply -f k8s/"
				}
			}
		}

		stage('Restart ToDo App Deployment') {
			steps {
				script {
					echo "Restarting ToDo App Deployment..."
					sh "kubectl rollout restart deployment spring-todo-app"
				}
			}
		}

		stage('Verify Deployment Status') {
			steps {
				script {
					echo "Checking rollout status..."
					sh "kubectl rollout status deployment spring-todo-app"
				}
			}
		}
	}

	post {
		success {
			echo "ToDo App deployed successfully to Minikube!"
		}
		failure {
			echo "Deployment failed. Check logs in Jenkins console."
		}
	}
}