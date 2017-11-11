# emacs25关于win10系统的配置如下
  + 下载emacs并解压（E:\Program Files\emacs 这是我的解压路径）

  + 设置系统环境变量。系统环境变量的path变量中增加 E:\Program Files\emacs（替换成你的解压路径，如果你解压到C:\Program Files\emacs，你就在path变量中加入一条：C\Program Files\emacs ）。

  + 快捷键win+r，在弹出的框中输入regedit，回车后打开了注册表编辑器，找到其中HKEY_LOCAL_MACHINE -> SOFTWARE -> GUN(没有的话右击SOFTWARE->新建->项，并命名为GNU) ->Emacs(没有的话右击GUN->新建->项，并命名为Emacs)->右击Emacs->新建->字符串值（将新建字符串条目的名称改为HOME，数据改为解压目录【我的为E:\Program Files\emacs】）

  + 最后在cmd中运行emacs -nw，查看安装效果。