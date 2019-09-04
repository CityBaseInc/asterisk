pipeline {
  agent none
  environment {
    PROJECT_NAME = 'asterisk'
  }
  stages {
    stage('Build & Push') {
      agent {
        // https://github.com/jenkinsci/kubernetes-plugin#declarative-pipeline
        kubernetes {
          label "asterisk-build"
          defaultContainer 'docker'
          yamlFile ".jenkins/pod.build.yaml"
        }
      }
      environment {
        BUILD_ENV = 'prod'
        ASTERISK_VERSION='16.3.0'
      }
      options {
        timeout(time: 30, unit: 'MINUTES')
      }
      // TODO: Docker-in-Docker?
      // TODO: Tag and push intermediate build stages?
      // TODO: Pull prior images for build caching?
      steps {
        script {
          docker.withRegistry('https://quay.io', 'quay-login'){
            def image = docker.build("citybaseinc/${env.PROJECT_NAME}:${env.GIT_COMMIT}", "--network=jenkins-bridge --build-arg ASTERISK_VERSION=${ASTERISK_VERSION} .")
            image.push("${env.GIT_COMMIT}")
            image.push("${env.GIT_BRANCH}")
            if(env.GIT_BRANCH == 'master'){
              image.push('latest')
            }
          }
        }
      }
    }
  }
}
