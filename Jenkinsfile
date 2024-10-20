pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your_username/UserManagementAPI.git' // Replace with your repo URL
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'bundle install' // Install Ruby gems
            }
        }

        stage('Run Tests') {
            steps {
                sh 'bundle exec rspec' // Run RSpec tests
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add any build steps if necessary
            }
        }
    }
}
