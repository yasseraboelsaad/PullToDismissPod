#
# Be sure to run `pod lib lint PullToDismissPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PullToDismissPod'
  s.version          = '1.0.1'
  s.summary          = 'A ViewController that can be dismissed by dragging the screen like the new mail View in the native mail App.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A ViewController that can be dismissed by dragging the screen like the new mail View in the native mail App. It also has a dark transparent background that clears up as the ViewController is being dismissed
DESC

  s.homepage         = 'https://github.com/yasseraboelsaad/PullToDismissPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasseraboelsaad' => 'yasser.aboelsaad@gmail.com' }
  s.source           = { :git => 'https://github.com/yasseraboelsaad/PullToDismissPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'PullToDismissPod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PullToDismissPod' => ['PullToDismissPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
