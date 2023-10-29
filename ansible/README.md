#Ansible Configuration 
---
 
# 1 - setup_master_instance.yaml: 
This file consists of multiple tasks that handle various processes, such as:
- updating apt repositories
- installing Python, OpenJDK-11, and Docker. 
- pull a Jenkins image
- deploy container and mounting volumes.
- Lastly, displays the initial password for accessing the Jenkins GUI.


# 2 - setup_slave_instance.yaml:
This file contains multiple tasks that manage a series of processes similar to the previous file. The new tasks include:
- Creating a Jenkins user and adding it to the Docker group.
- Modifying the docker.sock to enable the user to execute Docker commands.
- Generating an SSH key pair in the Jenkins user directory.
- Appending the public key to the authorized keys file as part of the process to connect the slave to the master using the SSH method.
- Lastly, displaying the private SSH key.

# 3 - setup_app_instance.yaml: 
- setup_app_instance.yaml: This file is responsible for managing Docker-related tasks on the application server, along with other relevant operations.

---
# inventory

```
[jenkins-master]
jenkins-master

[jenkins-slave]
jenkins-slave

[app]
app
```
> Each hostname ***(jenkins-master, jenkins-slave, app)*** is represented in the ./ssh/config file with the necessary configuration settings.
