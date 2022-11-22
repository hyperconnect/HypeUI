Pod::Spec.new do |s|
  s.name         = "HypeUI"
  s.version      = "0.3.0"
  s.summary      = "HypeUI is a implementation of Apple's SwiftUI DSL style based on UIKit"
  s.homepage     = "https://github.com/hyperconnect/HypeUI"
  s.license      = { :type => 'Apache 2.0', :file => "LICENSE" }
  s.author       = { 'Cruz' => 'cruz@hpcnt.com', 'Xeon' => 'xeon@hpcnt.com' }
  s.source       = { :git => 'https://github.com/hyperconnect/HypeUI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Sources/**/*.swift'
  s.swift_version = '5.0'
  s.dependency "RxSwift", '~> 6.0'
  s.dependency "RxCocoa", '~> 6.0'
  s.dependency "SnapKit", '~> 5.0.0'
end
