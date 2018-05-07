
Pod::Spec.new do |s|
  s.name         = "RNBraintreeDropin"
  s.version      = "1.0.0"
  s.summary      = "RNBraintreeDropin"
  s.description  = <<-DESC
                  React-Native binding to Braintree native Dropin UIs
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "waqqas.jabbar@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/waqqas/react-native-braintree-dropin.git", :tag => "master" }
  s.source_files  = "RNBraintreeDropin/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "BraintreeDropIn"

end

  