
Pod::Spec.new do |s|

  s.name         = "NICopyDBToSandBox"
  s.version      = "0.0.1"
  s.summary      = "A short description of NICopyDBToSandBox."  
  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://EXAMPLE/NICopyDBToSandBox"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "倪新生" => "1911398892@qq.com" }
  # Or just: s.author    = "倪新生"
  # s.authors            = { "倪新生" => "1911398892@qq.com" }
  # s.social_media_url   = "http://twitter.com/倪新生"
  # s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/wvqusrtg/NICopyDBToSandBox.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  
  s.requires_arc = true

end
