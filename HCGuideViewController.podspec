#
# Be sure to run `pod lib lint HCGuideViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HCGuideViewController'
  s.version          = '1.0.2'
  s.summary          = 'A simple guide view controller by Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple guide view controller by Swift. Implemente with collection view.
                       DESC

  s.homepage         = 'https://github.com/RainbowMango/HCGuideViewController'
#  s.screenshots     = 'https://github.com/RainbowMango/HCGuideViewController/blob/master/screenshot/screenshot1.png', 'https://github.com/RainbowMango/HCGuideViewController/blob/master/screenshot/screenshot2.png', 'https://github.com/RainbowMango/HCGuideViewController/blob/master/screenshot/screenshot3.png', 'https://github.com/RainbowMango/HCGuideViewController/blob/master/screenshot/screenshot4.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'RainbowMango' => 'qdurenhongcai@163.com' }
  s.source           = { :git => 'https://github.com/RainbowMango/HCGuideViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HCGuideViewController/*.{h,swift}'
  
  s.resource      = "HCGuideViewController/HCGuideViewController.bundle"

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
