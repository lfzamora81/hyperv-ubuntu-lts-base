pipeline {
    agent any
    environment {
        ZIP_FILE = fileExists 'focal-server-cloudimg-amd64-azure.vhd.zip'
        PS_CRED = credentials('winAdmin')
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
                powershell '''
                    $psPass = ConvertTo-SecureString "$PS_CRED_PSW" -AsPlainText -Force
                    $credential = New-Object System.Management.Automation.PSCredential ("$PS_CRED_USR", $psPass)
                    Convert-VHD -Credential $credential -Path .\\livecd.ubuntu-cpc.azure.vhd -DestinationPath .\\livecd.ubuntu-cpc.azure.vhdx
                '''
            }
        }
    }
}
