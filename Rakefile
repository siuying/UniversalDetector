namespace :test do
  desc "Run the UniversalDetector Tests for iOS"
  task :ios do
    $ios_success = system("xctool -project UniversalDetector.xcodeproj -scheme UniversalDetector -sdk iphonesimulator -configuration Release test -test-sdk iphonesimulator test")
  end

  desc "Run the UniversalDetector Tests for Mac OS X"
  task :osx do
    $osx_success = system("xctool -project UniversalDetector.xcodeproj -scheme UniversalDetectorOSX -sdk macosx -configuration Release test -test-sdk macosx")
  end
end

desc "Run the UniversalDetector Tests for iOS & Mac OS X"
task :test => ['test:ios', 'test:osx'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  puts "\033[0;31m! OS X unit tests failed" unless $osx_success
  if $ios_success && $osx_success
    puts "\033[0;32m** All tests executed successfully"
  else
    exit(-1)
  end
end

task :default => 'test'