pipeline {
	agent any

	environment {
		IMAGE_NAME = "janithad/spring-todo-app"
		NAMESPACE = "todo-app"
		KUBECONFIG = "/var/lib/jenkins/.kube/config"
	}

	stages {

		stage('Prepare Updated Deployment File') {
			steps {
				script {
					echo "Preparing deployment with image tag ${GIT_COMMIT}..."

					sh """
                        cp k8s/backend-deployment.yaml k8s/backend-deployment-temp.yaml
                        sed -i 's|IMAGE_TAG|${GIT_COMMIT}|g' k8s/backend-deployment-temp.yaml
                    """
				}
			}
		}

		stage('Apply Kubernetes Manifests') {
			steps {
				script {
					echo "Applying all manifests..."

					sh """
                        kubectl apply -f k8s/namespace.yaml
                        kubectl apply -f k8s/mysql-secret.yaml
                        kubectl apply -f k8s/mysql-pvc.yaml
                        kubectl apply -f k8s/mysql-deployment.yaml
                        kubectl apply -f k8s/mysql-service.yaml
                        kubectl apply -f k8s/backend-configmap.yaml
                        kubectl apply -f k8s/backend-service.yaml
                        kubectl apply -f k8s/ingress.yaml

                        kubectl apply -f k8s/backend-deployment-temp.yaml
                    """
				}
			}
		}

		stage('Verify Deployment Status') {
			steps {
				script {
					echo "Verifying rollout..."
					sh "kubectl rollout status deployment/spring-todo-app -n ${NAMESPACE}"
				}
			}
		}
	}

	post {
		success {
			echo "ToDo App deployed successfully to Minikube!"
		}
		failure {
			echo "Deployment failed. Check Jenkins logs."
		}
	}
}
