#
# Be sure to run `pod lib lint DVProgressLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DVProgressLabel'
  s.version          = '0.1.0'
  s.summary          = 'Label masked according to progress'
  s.homepage         = 'https://github.com/anjaeyoung26/DVProgressLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anjaeyoung26' => 'dkswodud011@naver.com' }
  s.source           = { :git => 'https://github.com/anjaeyoung26/DVProgressLabel.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'DVProgressLabel/Classes/**/*'
  s.swift_version = '5.0'
end
