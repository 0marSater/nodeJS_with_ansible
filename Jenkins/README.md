# Jenkinsfile

The Jenkins file is supposed to be running on an agent called ***slave1*** (or alternatively on the master, if preferred).

And it contain 5 stages:

![Pipeline Image](../Images/pipeline.png)

# 1 - Checkout:
This stage involves checking out the source code from the version control system using the checkout scm command. 
```
  stage('Checkout') {
            steps {
                checkout scm
            }
        }

```

# 2 - Build Docker Image:

In this stage, the script builds a Docker image using the Dockerfile present in the repository. It uses the commit hash as the tag for the Docker image.
```
    stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the commit hash as the tag
                    sh """"
                    cd .. &&
                    docker build . --file Dockerfile --tag nodejs:${commitHash}
                    """
                }
            }
        }
```

# 3 - Push Docker Image:

This stage is responsible for pushing the Docker image to a Docker registry (in this case, DockerHub). It first logs in to the DockerHub repository using the provided credentials ***(DOCKERHUB_ID)*** which is username and password existing on jenkins credentials. Then, it tags the Docker image with a commit hash version, and finally pushes it to the DockerHub repository.

```
stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_ID', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        echo "Log in to dockerhub repo ..."
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        // Build Docker image with the commit hash as the tag
                        echo "Tagging the image"
                        sh "docker tag nodejs:${commitHash} omarsater/private-repo:v-${commitHash}"

                        echo "Pushing to dockerhub ..."
                        sh "docker push omarsater/private-repo:v-${commitHash}"
                    }
                }
            }
        }
```


# 4 - Environment Input:

This stage collects user input to set up environment variables for the deployment process. It prompts the user to provide specific information, such as:
 - The app server IP.
 - RDS hostname.
 - RDS username.
 - RDS password.
 - RDS port.
 - Redis hostname.
 - Redis port.
```
  stage('Environment Input') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput',
                        message: 'Please provide the following information:',
                        parameters: [
                        string(defaultValue: '', description: 'Server IP', name: 'SERVER_IP'),
                        string(defaultValue: '', description: 'RDS Hostname', name: 'RDS_HOSTNAME'),
                        string(defaultValue: '', description: 'RDS Username', name: 'RDS_USERNAME'),
                        string(defaultValue: '', description: 'RDS Password', name: 'RDS_PASSWORD'),
                        string(defaultValue: '', description: 'RDS Port', name: 'RDS_PORT'),
                        string(defaultValue: '', description: 'Redis Hostname', name: 'REDIS_HOSTNAME'),
                        string(defaultValue: '', description: 'Redis Port', name: 'REDIS_PORT')
                    ]
                )
                        env.SERVER_IP = userInput['SERVER_IP']
                        env.RDS_HOSTNAME = userInput['RDS_HOSTNAME']
                        env.RDS_USERNAME = userInput['RDS_USERNAME']
                        env.RDS_PASSWORD = userInput['RDS_PASSWORD']
                        env.RDS_PORT = userInput['RDS_PORT']
                        env.REDIS_HOSTNAME = userInput['REDIS_HOSTNAME']
                        env.REDIS_PORT = userInput['REDIS_PORT']
                    }
            }
        }
```
 > Both RDS username and RDS password passed by terraform.tfvars.
 

# 5 - Deploy on Remote Server:

This stage is responsible for deploying the Docker image on a remote server. It utilizes SSH to connect to the specified app server using ***SSH Agent*** plugin and execute Docker-related commands with the previous environment variables. It pulls the previously pushed Docker image from the DockerHub repository and runs with provided environment variables. 
```
stage('Deploy on remote server') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_ID', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sshagent(['SERVER_CREDENTIALS']) {
                            sh """
                                ssh -o StrictHostKeyChecking=no ubuntu@${env.SERVER_IP} '
                                    docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD} &&
                                    docker pull omarsater/private-repo:v-${commitHash} &&
                                    docker run -d \
                                    -e RDS_HOSTNAME='${env.RDS_HOSTNAME}' \
                                    -e RDS_USERNAME='${env.RDS_USERNAME}' \
                                    -e RDS_PASSWORD="${env.RDS_PASSWORD}" \
                                    -e RDS_PORT='${env.RDS_PORT}' \
                                    -e REDIS_HOSTNAME='${env.REDIS_HOSTNAME}' \
                                    -e port='${env.REDIS_PORT}' \
                                    -p 80:3000 \
                                    omarsater/private-repo:v-${commitHash}
                                '
                            """
    
                        }
                    }
                }
            }
        }
    }
```
