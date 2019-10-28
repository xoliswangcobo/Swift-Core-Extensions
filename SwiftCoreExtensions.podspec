Pod::Spec.new do |s|
  s.name         = "SwiftCoreExtensions"
  s.version      = "1.0.0"
  s.summary      = "Collection of Swift language extensions."
  s.description  = "Collection of Swift language extensions for UIKIt and Foundation classes."
  s.homepage     = "https://github.com/xoliswangcobo/Swift-Core-Extensions"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Xoliswa Ngcobo" => "ngcobox@gmail.com" }
  s.ios.deployment_target  = '10.0'
  s.source       = { :git => "https://github.com/xoliswangcobo/Swift-Core-Extensions.git", :tag => s.version.to_s }
  s.source_files =  "SwiftCoreExtensions/**/*.swift"   
  s.requires_arc = true
  s.swift_version= "5.0"
  s.xcconfig     = { "SWIFT_VERSION" => "5.0" }
  
end