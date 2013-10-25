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
  s.dependency 'MagicalRecord', '~> 2.2'

  def uab.post_install(target_installer)
      momd_relative = '_iOS/Classes/DataModel/RBKDebugLoggerModel.momd'
      momd_full = config.project_pods_root + momd_relative
      unless momd_full.exist?
        puts "\nCompiling Core Data model\n".yellow if config.verbose?
        model = config.project_pods_root + '_iOS/Classes/DataModel/RBKDebugLoggerModel.xcdatamodeld'
        command = "xcrun momc '#{model}' '#{momd_full}'"
        command << " 2>&1 > /dev/null" unless config.verbose?
        unless system(command)
          raise ::Pod::Informative, "Core Data model"
        end
      end
 
      File.open(File.join(config.project_pods_root, target_installer.target_definition.copy_resources_script_name), 'a') do |file|
        file.puts "install_resource '#{momd_relative}'"
      end
    end
end
