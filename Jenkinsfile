pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vipin32/rails_jenkins_project.git' 
                
               echo 'Building the application...'
               bat 'ruby -v' 
               bat 'bundle -v' 
             
            }
        }
        
        stage('Install Dependencies') {
            steps {
                bat 'bundle install'
            }
        }
        
        stage('Run Migrations') {
            steps {
                bat 'bundle exec rails db:migrate RAILS_ENV=test'  // Run migrations for the test environment
            }
        }
        
        stage('Run Tests') {
            steps {
                bat 'bundle exec rspec' // Run RSpec tests
            }
        }
        
    }
}
