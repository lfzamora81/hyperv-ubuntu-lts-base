pipeline {
    agent any
    environment {
        ZIP_FILE = fileExists 'focal-server-cloudimg-amd64-azure.vhd.zip'
    }
    stages {
        stage('Download') {
            when { expression { ZIP_FILE == 'false'} }
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
                powershell 'Convert-VHD -Path .\\livecd.ubuntu-cpc.azure.vhd -DestinationPath .\\livecd.ubuntu-cpc.azure.vhdx'
            }
        }
    }
}
