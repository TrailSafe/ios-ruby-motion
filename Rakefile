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
  app.pixate.key  = 'J144G-PVVDP-LRTHO-P7JQQ-TTJJC-34J9F-RPF3C-IS0GG-L0JE0-HDBFQ-4DBNN-M5KOI-E5S40-RFOIR-VG51L-2O'
  app.pixate.framework = 'vendor/PXEngine.framework'
  app.fonts = ['cubano.ttf']
end

# Track and specify files and their mutual dependencies within the :motion Bundler group
MotionBundler.setup