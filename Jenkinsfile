pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/vipin32/rails_jenkins_project.git' 
                    
                    // Check Ruby and Bundler versions
                    echo 'Checking Ruby and Bundler versions...'
                    bat 'ruby -v'
                    bat 'bundle -v'
                }
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    echo 'Installing dependencies...'
                    bat 'bundle install'
                }
            }
        }
        
        stage('Run Migrations') {
            steps {
                script {
                    echo 'Running database migrations...'
                    bat 'bundle exec rails db:migrate RAILS_ENV=test'  // Use environment variable
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    echo 'Running RSpec tests...'
                    bat 'bundle exec rspec' // Run RSpec tests
                }
            }
        }
        
    }

    post {
        always {
            echo 'Cleaning up...'
            // Add any cleanup steps if necessary, such as removing temporary files
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
