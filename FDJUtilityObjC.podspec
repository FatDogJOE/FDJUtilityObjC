#
# Be sure to run `pod lib lint FDJUtilityObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FDJUtilityObjC'
  s.version          = '0.1.0-beta.4'
  s.summary          = 'A utility library for ObjectiveC'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/FatDogJOE/FDJUtilityObjC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe' => 'likethephoenix@163.com' }
  s.source           = { :git => 'https://github.com/FatDogJOE/FDJUtilityObjC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.subspec 'Categories' do |categories|
      categories.source_files = 'FDJUtilityObjC/Classes/Categories/**/*'
      categories.public_header_files = 'FDJUtilityObjC/Classes/Categories/*.{h}'
  end
  
  s.subspec 'Utility' do |utility|
      utility.source_files = 'FDJUtilityObjC/Classes/Utility/**/*'
      utility.public_header_files = 'FDJUtilityObjC/Classes/Utility/*.{h}'
      utility.dependency 'SAMKeychain', '~> 1.5.3'
      utility.dependency 'FDJUtilityObjC/Categories'
  end
  
  s.subspec 'SerialTask' do |serialTask|
      serialTask.source_files = 'FDJUtilityObjC/Classes/SerialTask/**/*'
      serialTask.public_header_files = 'FDJUtilityObjC/Classes/SerialTask/*.{h}'
  end
  
  # s.resource_bundles = {
  #   'FDJUtilityObjC' => ['FDJUtilityObjC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
