pipeline {
  agent any
  stages {
    stage('Login') {
      steps {
        withCredentials(bindings: [string(credentialsId: 'DOCKER_IO_ACCESS_TOKEN', variable: 'DOCKER_IO_ACCESS_TOKEN')]) {
          sh 'echo $DOCKER_IO_ACCESS_TOKEN | docker login --password-stdin -u wstein'
        }

      }
    }

    stage('Build Images') {
      parallel {
        stage('Almalinux') {
          steps {
            sh 'docker build -t wstein/almalinux:latest -f docker/almalinux/Dockerfile .'
            sh 'docker push wstein/almalinux:latest'
          }
        }

        stage('Archlinux') {
          steps {
            sh 'docker build -t wstein/archlinux:latest -f docker/archlinux/Dockerfile .'
            sh 'docker push wstein/archlinux:latest'
          }
        }

        stage('Alpine') {
          steps {
            sh 'docker build -t wstein/alpine:latest -f docker/alpine/Dockerfile .'
            sh 'docker push wstein/alpine:latest'
          }
        }

        stage('CentOS') {
          steps {
            sh 'docker build -t wstein/centos:latest -f docker/centos/Dockerfile .'
            sh 'docker push wstein/centos:latest'
          }
        }

        stage('Crystal lang') {
          steps {
            sh 'docker build -t wstein/crystal:latest -f docker/lang/crystal/Dockerfile .'
            sh 'docker push wstein/crystal:latest'
          }
        }

        stage('Debian') {
          steps {
            sh 'docker build -t wstein/debian:latest -f docker/debian/Dockerfile .'
            sh 'docker push wstein/debian:latest'
          }
        }

        stage('Fedora') {
          steps {
            sh 'docker build -t wstein/fedora:latest -f docker/fedora/Dockerfile .'
            sh 'docker push wstein/fedora:latest'
          }
        }

        stage('Fedora Toolbox') {
          steps {
            sh 'docker build -t wstein/fedora-toolbox:latest -f docker/fedora-toolbox/Dockerfile .'
            sh 'docker push wstein/fedora-toolbox:latest'
          }
        }

        stage('OpenSUSE') {
          steps {
            sh 'docker build -t wstein/opensuse:latest -f docker/opensuse/Dockerfile .'
            sh 'docker push wstein/opensuse:latest'
          }
        }

        stage('Ubuntu') {
          steps {
            sh 'docker build -t wstein/ubuntu:latest -f docker/ubuntu/Dockerfile .'
            sh 'docker push wstein/ubuntu:latest'
          }
        }

      }
    }

    stage('Logout') {
      steps {
        sh 'docker logout'
      }
    }

    stage('Cleanup') {
      steps {
        sh 'docker image prune -f'
      }
    }

  }
}