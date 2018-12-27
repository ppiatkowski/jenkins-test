pipeline {
  agent any
  environment {
    GIT = credentials('github')
  }
  stages {
      stage('Checkout') {
          steps {
              checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/ppiatkowski/jenkins-test']]])
          }
      }
    // stage('Prerequisites') {
    //   environment {
    //     GEONOSIS_USER_PASSWORD = credentials('GeonosisUserPassword')
    //     CLIENT_ID = credentials('VisionClientID')
    //     CLIENT_PASSWORD = credentials('VisionClientPassword')
    //   }
    //   steps {
        // sh 'security unlock-keychain -p ${GEONOSIS_USER_PASSWORD} login.keychain'
        // sh 'scripts/create_keys_file.sh ${CLIENT_ID} ${CLIENT_PASSWORD}'
        // lock('refs/remotes/origin/master') {
        //   sh '/usr/local/bin/pod install --repo-update --project-directory=JenkinsTest/'
        // }
    //   }
    // }
    stage('Static analysis') {
      steps {
        sh '/usr/local/bin/danger-swift ci'
      }
    }
    stage('Build') {
      steps {
          sh 'xcodebuild -scheme JenkinsTest -configuration Debug build test -destination "platform=iOS Simulator,name=iPhone 8,OS=12.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'

        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
      }
    }
    stage('Unit tests') {
      steps {
        sh 'xcodebuild test -scheme JenkinsTest -destination \'platform=iOS Simulator,name=iPhone 8\''
      }
    }
  }
}
