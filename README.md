## NICopyDBToSandBox
---

>1、效果Flowing
![](./Res/Result.png)

NICopyDBToSandBox (0.0.1)
   NICopyDBToSandBox:拷贝DB文件到沙盒里的Document目录下
   - pod 'NICopyDBToSandBox', '~> 0.0.1'
   - Homepage: https://nixinsheng.github.io/
   - Source:   https://github.com/wvqusrtg/NICopyDBToSandBox.git
   - Versions: 0.0.1 [master repo]
---

##自己封装开源库上传到cocoapods
>step1:github上开仓库
![](./Res/1、github上开仓库.png)

>step2:本地开工程执行操作如下：
>>1st:git init
>>2st:git remote add origin https://github.com/wvqusrtg/NICopyDBToSandBox.git
![](./Res/2、gitremoteaddorigin.png)
>>3st:git pull origin master

>step3:[使开源库支持pod](http://tech.yunyingxbs.com/article/detail/id/272.html)
>![](./Res/3、使开源库支持pod.png)

>step4:[NICopyDBToSandBox.podspec](NICopyDBToSandBox.podspec)
>![](./Res/4、podspec.png)

>![](./Res/4.1、podspec.png)

>step5:这里呢，我们设置的版本号为0.0.1，那么tag号为0.0.1，因此我们还需要新建一个tag,名为0.0.1，然后推到git：

>$ git commit -m "如果当前有变化，先提交到git上，再创建tag"

>$ git tag 0.0.1

>$ git push --tags

>$ git push origin master

>step6:![](./Res/5.png)

>step7:![](./Res/6.png)

>step8:![](./Res/7.png)

>step9:![](./Res/8.png)
