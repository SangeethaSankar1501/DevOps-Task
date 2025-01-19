# DevOps-Task - Fibonacci container 

**Overview**

Creating a DockerHelper module with PowerShell cmdlets to interact with Docker on a remote host run Fibonacci container. That continuously outputs Fibonacci numbers if no parameters are given and outputs the nth Fibonacci number when provided a parameter.


**Requirements**

-Powershell Version 7.4.6
-Ubuntu VM
-Docker 


**Cmdlets**

**Build-DockerImage** : Builds a Docker image in the remote host(Ubuntu VM).

Import-Module "C:\Users\username\OneDrive\Desktop\VS_files\FibonacciDockerHelper\DockerHelper.psm1"

Build-DockerImage -ComputerName "ranee18102023@35.229.97.119" `
    -Dockerfile "/home/ranee18102023/Dockerfile" `
    -Tag "fibonacci:latest" `
    -Context "/home/ranee18102023/"

**Copy-Prerequisites** : Copies necessary files to a remote host before building a Docker image.

Copy-Prerequisites -ComputerName "ranee18102023@35.229.97.119" `
    -Path "C:\Users\Sange\OneDrive\Desktop\VS_files\FibonacciDockerHelper\Fibonacci.ps1", `
    "C:\Users\Sange\OneDrive\Desktop\VS_files\FibonacciDockerHelper\run-fibonacci.ps1", `
    "C:\Users\Sange\OneDrive\Desktop\VS_files\FibonacciDockerHelper\Dockerfile" `
    -Destination "/home/ranee18102023"
 

**Run-DockerContainer** : Runs a Docker container in the remote host(Ubuntu VM).

Run-DockerContainer -ComputerName "ranee18102023@35.229.97.119" `
    -ImageName "fibonacci:latest"


**Setup Steps**


**1. Setting up PowerShell on the Local Laptop:**
I already had PowerShell installed on my local Windows laptop. If needed, you can install or upgrade PowerShell from GitHub.

**2. Creating and Configuring the VM on Google Cloud Platform (GCP):**
I created a ubuntu VM on Google Cloud Platform (GCP).
Installed Docker and Powershell.
Assigned sufficient permissions to ensure it can run Docker commands.

**3. Setting up SSH Access to the VM:**
On my local machine, I generated SSH keys using ssh-keygen and saved the public and private key pair.
I copied the public key into the authorized_keys file on the remote GCP VM:
SSH into the VM and added the public key into the ~/.ssh/authorized_keys file for the user you will log in as.
I verified SSH access by running ssh username@<VM_IP> from my local machine to ensure that I could connect securely.

**4. Running the Docker Commands:**
I ran the PowerShell commands on my local Windows PowerShell to interact with the remote Ubuntu VM.
The DockerHelper PowerShell module was used locally to initiate commands that built the Docker image, copied the prerequisites (if needed), and ran the Docker container on the Ubuntu VM.

**5. Testing the Fibonacci Container:**
I tested the Fibonacci Docker container to ensure it correctly outputs Fibonacci numbers either continuously or based on the provided parameter.