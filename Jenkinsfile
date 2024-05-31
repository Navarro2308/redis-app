pipeline {
    agent any
    stages {
        stage('build da imagem docker'){
            steps{
                sh 'docker build -t devops/app .'
            }
        }
        stage('subir docker compose - redis e app'){
            steps {
                sh 'docker-compose up --build -d'
            }
        }
        stage('sleep para subida de containers'){
            steps{
                sh 'sleep 10'
            }
        stage('sonarqube validation'){
            steps{
                script{
                    scanerHome = tool 'sonarscanner';
                }
                withSonarQubeEnv('sonar-server'){
                    sh "${scanner-Home}/bin/sonar-scanner -Dsonar.projectKey=redis-app -Dsonar.soucers=. Dsonar.host.url=${env.SONAR_HOST-URL} -Dsonar.login=${env.SONAR_AUTH_TOKEN}"
                }
            }           
        }
        stage('teste da aplicação'){
            steps{
                sh 'chmod +x teste-app.sh'
                sh 'dos2unix teste-app.sh'
                sh './teste-app.sh'
            }
        }
        stage('shutdown dos containers de teste'){
            steps{
                sh 'docker-compose down'
                
            }
        }

    }
}        
 



 
        

