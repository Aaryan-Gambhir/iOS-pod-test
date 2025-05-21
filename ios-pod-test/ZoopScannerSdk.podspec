Pod::Spec.new do |spec|
  spec.name         = "ZoopScannerSdk"
  spec.version      = "0.0.3"
  spec.summary      = "A document scanner SDK using ML & Vision."
  spec.description  = "ZoopScannerSdk is a powerful document scanner SDK that integrates Vision and Machine Learning (TFLite)."
  spec.homepage     = "https://github.com/zoop/zoop-scanner-sdk-ios.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Zoop" => "divyank@zoop.one" }

  # Update to iOS 14.0 for PHPickerViewController
  spec.platform     = :ios, "14.0"
  spec.swift_version = "5.0"
  spec.static_framework = true
  
  spec.vendored_frameworks = "Pod/ZoopScannerSdk.xcframework"


  # Make sure tag matches version
  spec.source       = { :git => "https://github.com/divyank96/zoop-ios-scanner-pod", :tag => "#{spec.version}" }
  #spec.source       = { :git => "https://github.com/divyank96/zoop-ios-scanner-pod", :tag => "#{spec.version}" }
#  spec.source       = { :git => "https://github.com/divyank96/zoop-ios-scanner-pod", :tag => "#{spec.version}" }
  
#  # Resources
#  spec.resources = [
#     "ZoopScannerSdk/ZoopScannerSdk/Resources/*.tflite",
#     "ZoopScannerSdk/ZoopScannerSdk/Resources/*.jpg",
#     "ZoopScannerSdk/ZoopScannerSdk/Resources/GoogleService-Info.plist",
#  ]
#
#  spec.resource_bundles = {
#    "ZoopScannerSdkAssets" => [
#      "ZoopScannerSdk/ZoopScannerSdk/Resources/Assets.xcassets",
#      "ZoopScannerSdk/ZoopScannerSdk/Resources/Fonts/**/*.{ttf,otf}"
#    ]
#  }

  spec.frameworks = "UIKit", "Vision", "AVFoundation", "CoreImage"
  
  # Dependencies
  spec.dependency "TensorFlowLiteSwift", "~> 2.12.0"
  spec.dependency "TensorFlowLiteC", "~> 2.12.0"
  spec.dependency 'Firebase/Firestore'
  spec.dependency 'Firebase/Analytics'
  spec.dependency 'Firebase/Core'
  spec.dependency 'FirebaseStorage'
  spec.dependency 'Firebase/MLModelDownloader'

  # Fix for architecture issues - build for both Intel and Apple Silicon
  spec.pod_target_xcconfig = {
    "FRAMEWORK_SEARCH_PATHS" => "$(inherited) $(PODS_CONFIGURATION_BUILD_DIR)/TensorFlowLiteSwift",
    "LIBRARY_SEARCH_PATHS" => "$(inherited)",
    "OTHER_LDFLAGS" => "-framework TensorFlowLiteSwift",
    "OTHER_CFLAGS" => "$(inherited) -Wno-error=unused-command-line-argument",
    "VALID_ARCHS" => "arm64 arm64e x86_64",
    "VALID_ARCHS[sdk=iphonesimulator*]" => "arm64 x86_64",
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => ""
  }
  
  # Support for all architectures in user targets
  spec.user_target_xcconfig = {
    "VALID_ARCHS[sdk=iphonesimulator*]" => "arm64 x86_64",
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => ""
  }
end
