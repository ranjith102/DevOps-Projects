Jenkins CI/CD Pipeline - Ansible, Docker, Github Webhooks on AWS




https://www.youtube.com/watch?v=h7k45phtZgc

Jenkins CI/CD Pipeline - Ansible, Docker, Github Webhooks on AWS

Create a Repo and Push the code inside

Create a EC2: Jenkins
Enable the Port
sudo apt update -y
sudo hostnamectl set-hostname jenkins
/bin/bash
sudo apt update -y
sudo apt install -y openjdk-17-jre
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
Login from the jenkins
sudo apt install python3-pip
pip install docker
cd /etc/ansible
sudo nano hosts
[dockerservers]
IP
cd ~
ls
sudo su
su jenkkins
cd ~
mkdir playbooks
cd playbooks
ssh-keygen
cd .ssh
ls
cat id_rsa.pub
Copy this key and Paste on the docker authorized_Key
ssh root@ip of Docker Server
exit

cd ..
cd playbook
nano deployment.yaml
- name: Build & Deploy Docker Container
  hosts: dockerservers
  gather_facts: false
  remote_user: root
  tasks:
    - name: Copy the files to remote server
      become: true
      copy:
        src: /var/lib/jenkins/workspace/ansible-jenkins-pipeline
        dest: ~/project
    - name: Building Docker Image
      docker_image:
         name: mico:latest
         build: 
           path: ~/project
         state: present


    - name: Creating Docker Container
      docker_container:    
         name: mico-container
      
Docker:

sudo apt update -y
sudo hostnamectl set-hostname jenkins
/bin/bash
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
docker run hello-world
sudo systemctl status docker
sudo systemctl start docker
sudo su
ssh-keygen
cd ~/
ls
ls -la
cd .ssh/
ls 
nano authorized_keys
systemctl reload sshd
mkdir project


Ansible
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible


ansible-playbook deployment.yaml

Jenkins:

New Item: Ansible-jenkins-pipeline > Freestyle > Source code Management > Paste the URL > Build NOW
ansible-playbook deployment.yaml
Add Webhooks
Modify something



