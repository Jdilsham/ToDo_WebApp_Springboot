pipeline {
	agent any

	environment {
		IMAGE_NAME = "janithad/spring-todo-app"
		NAMESPACE = "todo-app"
	}

	stages {

		stage('Update Deployment Image Tag') {
			steps {
				script {
					echo "Replacing IMAGE_TAG with ${GIT_COMMIT} in deployment.yaml..."

					sh """
                        sed -i 's|IMAGE_TAG|${GIT_COMMIT}|g' k8s/deployment.yaml
                    """
				}
			}
		}

		stage('Deploy Kubernetes Manifests') {
			steps {
				script {
					echo "Applying Kubernetes manifests from k8s/ folder..."
					sh "kubectl apply -f k8s/"
				}
			}
		}

		stage('Restart Deployment') {
			steps {
				script {
					echo "Restarting deployment..."
					sh "kubectl rollout restart deployment spring-todo-app -n ${NAMESPACE}"
				}
			}
		}

		stage('Verify Deployment Status') {
			steps {
				script {
					echo "Checking rollout status..."
					sh "kubectl rollout status deployment spring-todo-app -n ${NAMESPACE}"
				}
			}
		}
	}

	post {
		success {
			echo "ToDo App deployed successfully to Minikube using Docker Hub image!"
		}
		failure {
			echo "Deployment failed. Check logs in Jenkins console."
		}
	}
}
