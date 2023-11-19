# Setup

## TODOs

1. 主题设置为暗色；关闭开始菜单建议；任务栏置顶；修改任务栏配置
2. 语言设置为英语；安装日语
3. 删除 WINDOWS 管理员的权限提示：
   Setting -> Administrator -> Change user account control settings
4. 按照文档修改输入法为双拼
5. 调整资源管理器为显示拓展名
6. 从 t7/Tools 中使用脚本 cap2ctrl.reg，重启
7. 安装 Chrome；从硬盘中安装 clash；安装 QQ 以接收订阅链接；调整 clash 中部分设置；登录并同步 Chrome
8. 安装 VSC；安装 7-zip 并在选项中去除部分内容
9. 安装[FiraCode font](https://github.com/tonsky/FiraCode/releases)
10. 配置 Arch 环境
11. 关闭 Windows 搜索中的热门搜索：
    ```PowerShell
    reg add HKCU\Software\Policies\Microsoft\Windows\explorer /v DisableSearchBoxSuggestions /t reg_dword /d 1 /f
    ```
12. 卸载 Onedrive
13. 调整主题等设置内容
14. 安装 Office(T7)并使用 MAS（T7）扩展证书
15. 安装剩余软件
16. 关闭公共防火墙以在 WSL2 中使用代理，使用管理员权限 PowerShell 输入以下命令允许 WSL2 通过防火墙

```PowerShell
  New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
```

## Tips

1. Boot-up path: C:\Users\akiha\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
2. win right-click menu cleanup: Computer\HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers
