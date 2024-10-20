pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vipin32/rails_jenkins_project.git' 
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
