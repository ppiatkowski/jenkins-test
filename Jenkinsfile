pipeline {
  agent any
  environment {
    GIT = credentials('github')
  }
  stages {
    //stage('Static analysis') {
    //  steps {
    //    sh '/usr/local/bin/danger-swift ci'
    //  }
    //}
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
