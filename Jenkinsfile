pipeline {
    agent any
    stages {
        stage('Download') {
            steps {
                powershell '''
                    # Source file location
                    $source = 'https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-azure.vhd.zip'
                    # Destination to save the file
                    $destination = 'focal-server-cloudimg-amd64-azure.vhd.zip'
                    # Download the file
                    Invoke-WebRequest -Uri $source -OutFile $destination
                '''
            }
        }
        stage('Unzip') {
            steps {
                bat 'tar -xf focal-server-cloudimg-amd64-azure.vhd.zip'
            }
        }
        stage('Convert') {
            steps {
                powershell 'Convert-VHD -Path .\\focal-server-cloudimg-amd64-azure.vhd -DestinationPath .\\focal-server-cloudimg-amd64-azure.vhdx'
            }
        }
    }
}
