
Pod::Spec.new do |s|

  s.name         = "NICopyDBToSandBox"
  s.version      = "0.0.1"
  s.summary      = "NICopyDBToSandBox:拷贝DB文件到沙盒里的Document目录下"  
  s.description  = <<-DESC
                    拷贝文件到沙盒里的Document目录下（eg:AS.sqlite），提供了常用的API，调用简单。若在使用过程中有问题，请反馈与作者，以便完善之！
                   DESC

  s.homepage     = "https://nixinsheng.github.io/"
  s.license      = "MIT"
  s.author             = { "倪新生" => "1911398892@qq.com" }
  # s.social_media_url   = "http://weibo.com/1374831937/profile?topnav=1&wvr=6"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/wvqusrtg/NICopyDBToSandBox.git", :tag => "0.0.1" }
  s.source_files  = "NICopyDBToSandBox", "*.{h,m}"
  
  s.requires_arc = true

end
