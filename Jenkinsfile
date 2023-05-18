pipeline {

  agent any

  environment {
    POM_GROUP_ID = readMavenPom().getGroupId()
    POM_VERSION = readMavenPom().getVersion()
    BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
    GIT_TAG_COMMIT = sh (script: 'git describe --tags --always', returnStdout: true).trim()
    //IS_SNAPSHOT = readMavenPom().getVersion().endsWith("-SNAPSHOT")
    IS_SNAPSHOT = getMavenVersion().endsWith("-SNAPSHOT")
    version_a = getMavenVersion()
  }

  stages {
    stage('Init') {
      steps {
        echo "version_a: ${env.versiona_a}"
        script {println type: IS_SNAPSHOT.getClass()}
        echo sh(script: 'env|sort', returnStdout: true)
        echo "Variable params: ${params}"
        //echo "params.PARAM_1: ${params.PARAM_1}"

      }
    }
    stage('Build') {
      when {
        expression { false }  //disable this stage
      }
      steps {
        sh './mvnw -B clean package -DskipTests'
        archive includes: '**/target/*.jar'
        stash includes: '**/target/*.jar', name: 'jar'
      }
    }

  }
}



def getMavenVersion() {
  return sh(script: "./mvnw org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -v '\\['  | tail -1", returnStdout: true).trim()
}
