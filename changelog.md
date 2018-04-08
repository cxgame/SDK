##v0.1.5       <font size = 2>2018年1月11日 </font>

* 增加iap支付支持
* “快速注册”改为“游客登录”
* 删除查询是否审核状态接口
* 删除查询支付是否可用接口，全部支付流程均由SDK自己处理

##v0.1.6       <font size = 2>2018年1月13日 </font>

* <font color=red>修复打开webview时低版本ios严重闪退bug</font>
* <font color=red>更改WKWebView控件为UIWebView以兼容部分iOS10无法载入(白屏)问题</font>

##v0.1.7       <font size = 2>2018年3月14日 </font>

* 增加隐私政策配置
* 增加审核切界面机制
* 微调布局

##v0.1.8       <font size = 2>2018年3月20日 </font>

* SDK由静态改为动态
* 增加iap支付失败回调判断

##v0.1.9       <font size = 2>2018年4月8日 </font>

* 删除初始化接口，改didFinishLauhching里获取plist里的gamekey初始化
* 增加生命周期接口
* 支付接口增加玩家角色信息采集