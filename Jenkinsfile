pipeline {
	agent any

	environment {
		IMAGE_NAME = "janithad/spring-todo-app"
		NAMESPACE = "todo-app"
		KUBECONFIG = "/var/lib/jenkins/.kube/config"
	}

	stages {

		stage('Prepare Deployment File') {
			steps {
				script {
					sh """
                        cp k8s/backend-deployment.yaml k8s/backend-deployment-temp.yaml
                        sed -i 's|IMAGE_TAG|${GIT_COMMIT}|g' k8s/backend-deployment-temp.yaml
                    """
				}
			}
		}

		stage('Deploy to GKE') {
			steps {
				script {
					sh """
                        kubectl apply -f k8s/namespace.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/mysql-secret.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/mysql-pvc.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/mysql-deployment.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/mysql-service.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/backend-configmap.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/backend-service.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/ingress.yaml
                        kubectl apply -n ${NAMESPACE} -f k8s/backend-deployment-temp.yaml
                    """
				}
			}
		}

		stage('Verify Rollout') {
			steps {
				script {
					sh "kubectl rollout status deployment/spring-todo-app -n ${NAMESPACE}"
				}
			}
		}
	}

	post {
		success { echo "Deployed successfully to GKE!" }
		failure { echo "Deployment failed" }
	}
}
