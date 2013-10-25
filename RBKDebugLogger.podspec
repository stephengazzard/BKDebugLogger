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
  s.resources = 'Classes', '_iOS/Classes/**/*.{xcdatamodeld}'
  s.framework = 'Foundation'
  s.requires_arc = true  
  s.dependency 'MagicalRecord', '~> 2.2'

end
