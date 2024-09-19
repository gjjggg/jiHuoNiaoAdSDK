Pod::Spec.new do |spec|

  spec.name         = "JIHuoNiaoAD"
  
  spec.version      = "0.0.0.1"
  
  spec.license      = "MIT"
  
  spec.summary      = "初始化"
  
  spec.homepage     = "https://github.com/gjjggg/jiHuoNiaoAdSDK"
  
  spec.source       = { :git => "https://github.com/gjjggg/jiHuoNiaoAdSDK.git", :tag => "#{spec.version}" }
  
  spec.vendored_frameworks = 'jiHuoNIaoSDk/JIHuoNiaoAdSDK.framework'
  spec.frameworks = "AVFoundation","CFNetwork","CoreFoundation","CoreGraphics","CoreLocation","Foundation","MediaPlayer","Security","StoreKit","UIKit","WebKit","SystemConfiguration","QuartzCore","MobileCoreServices","CoreTelephony"
  spec.platform     = :ios, "12.0" #平台及支持的最低版本
  spec.resource = 'jiHuoNIaoSDk/JIHuoNiaoImage.bundle'
  
  spec.description  = <<-DESC
                         库
                   DESC
                   
                   
  spec.author             = { "liuqun" => "1271719322@qq.com" }
  
end
