pipeline {
    agent any
    environment {
        ZIP_FILE = fileExists 'focal-server-cloudimg-amd64-azure.vhd.zip'
        VHD_FILE = fileExists 'livecd.ubuntu-cpc.azure.vhd'
        // PS_CRED = credentials('winAdmin')
    }
    stages {
        stage('Download') {
            when { expression { ZIP_FILE == 'false'} }
            steps {
                powershell '''
                    # Source file location
                    $source = 'https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img'
                    # Destination to save the file
                    $destination = 'focal-server-cloudimg-amd64.img'
                    # Download the file
                    Invoke-WebRequest -Uri $source -OutFile $destination
                '''
            }
        }
        stage('Unzip') {
            when { expression { VHD_FILE == 'false'} }
            steps {
                bat 'tar -xf focal-server-cloudimg-amd64-azure.vhd.zip'
            }
        }
        stage('Convert') {
            steps {
                powershell 'convert.ps1'
            }
        }
    }
}
