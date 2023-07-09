# Setup

## TODOs

1. 主题设置为暗色；关闭开始菜单建议；任务栏置顶；修改任务栏配置
2. 语言设置为英语；安装日语
3. 删除WINDOWS管理员的权限提示：
  Setting -> Administrator -> Change user account control settings
4. 按照文档修改输入法为双拼
5. 调整资源管理器为显示拓展名
6. 从t7/Tools中使用脚本cap2ctrl.reg，重启
7. 安装Chrome；从硬盘中安装clash；安装QQ以接收订阅链接；调整clash中部分设置；登录并同步Chrome
8. 安装VSC；安装7-zip并在选项中去除部分内容
9. 安装[FiraCode font](https://github.com/tonsky/FiraCode/releases)
10. 配置Arch环境
11. 关闭Windows搜索中的热门搜索：
    ```PowerShell
    reg add HKCU\Software\Policies\Microsoft\Windows\explorer /v DisableSearchBoxSuggestions /t reg_dword /d 1 /f
    ```
12. 卸载Onedrive
13. 调整主题等设置内容
14. 安装Office(T7)并使用MAS（T7）扩展证书
15. 安装剩余软件
16. 关闭公共防火墙以在WSL2中使用代理，使用管理员权限PowerShell输入以下命令允许WSL2通过防火墙
  ```PowerShell
    New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
  ```

## Tips

1. Boot-up path: C:\Users\akhia\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
2. win right-click menu cleanup: Computer\HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers
