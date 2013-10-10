# -*- coding: utf-8 -*-
#
# Be sure to run `pod spec lint RoboKit.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "RBKDebugLogger"
  s.version      = "0.0.1"
  s.summary      = "Logger that allows easier remote debugging"
  s.homepage     = "https://github.com/stephengazzard/BKDebugLogger"
  s.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
	Test
    LICENSE
  }
  s.authors       = { 
    "Stephen Gazzard" => "stephen.gazzard@robotsandpencils.com"
  }
  s.source       = { :git => "https://github.com/stephengazzard/BKDebugLogger.git" }
  s.platform     = :ios
  s.source_files = 'Classes', '_iOS/Classes/**/*.{h,m}'
  s.framework = 'Foundation'
  s.requires_arc = true  
end
