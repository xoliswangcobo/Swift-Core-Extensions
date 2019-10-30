Pod::Spec.new do |s|
  s.name         = "SwiftCoreExtensions"
  s.version      = "1.0.0"
  s.summary      = "Collection of Swift language extensions."
  s.description  = "Collection of Swift language extensions for UIKIt and Foundation classes."
  s.homepage     = "https://github.com/xoliswangcobo/SwiftCoreExtensions"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Xoliswa Ngcobo" => "ngcobox@gmail.com" }
  s.ios.deployment_target  = '10.0'
  s.source       = { :git => "https://github.com/xoliswangcobo/SwiftCoreExtensions.git", :tag => "#{s.version}" }
  s.source_files =  "#{s.version}/SwiftCoreExtensions.framework/Headers/*.h"
  s.public_header_files = "#{s.version}/SwiftCoreExtensions.framework/Headers/*.h"
  s.vendored_frameworks = "#{s.version}/SwiftCoreExtensions.framework"
  s.requires_arc = true
  s.swift_version= "5.0"
  s.xcconfig     = { "SWIFT_VERSION" => "5.0" }
  
end
