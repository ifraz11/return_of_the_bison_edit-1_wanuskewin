# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
$:.unshift("~/.rubymotion/rubymotion-templates")

require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Lowell Observatory'
  app.frameworks += %w[SceneKit QuartzCore GLKit CoreLocation AVFoundation AVKit CoreMedia]
  app.files += Dir.glob(File.join(app.project_dir, '../lib/**/*.rb'))
  app.deployment_target = '10.10'
  app.info_plist['CFBundleIconName'] = 'AppIcon'
  
  #QCode Support
  app.vendor_project('vendor/quartzcode', :static, :cflags => '-fobjc-arc')
  
  #Phidget Support
  app.embedded_frameworks += ['/Library/Frameworks/Phidget22.framework']
  app.bridgesupport_files << 'resources/phidget22.bridgesupport'
  app.vendor_project('./vendor/phidget22', :static)
  #app.embedded_frameworks += ['/Library/Frameworks/Phidget21.framework']
  #app.vendor_project('./vendor/phidget21', :static) #shaun only has an old encoder
  
  #Video View
  app.vendor_project('./vendor/RMVideoView', :static, :cflags => '-fobjc-arc')
  
  app.pods do
    pod 'CocoaAsyncSocket'
    pod 'FastSocket'
  end
end
