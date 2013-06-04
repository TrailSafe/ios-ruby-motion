# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "bundler"
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TrailSafe (rb)'
  app.prerendered_icon = true
  app.interface_orientations = [:portrait, :portrait_upside_down]
  # app.detect_dependencies = false
  app.pixate.user = 'jason@waldrip.net'
  app.pixate.key  = 'G6OEU-68BUE-C8NKI-E3GHO-SV7NO-C2QN0-RSKET-6B9C5-707JS-451BA-IE4OP-HG0C6-SHC0S-P68JG-I3LF7-J6'
  app.pixate.framework = 'vendor/PXEngine.framework'
  app.fonts = ['cubano.ttf']
end

# Track and specify files and their mutual dependencies within the :motion Bundler group
MotionBundler.setup