# Setup

## 语言

1. 在设置中安装中文
2. 进入选项增加自然码双拼
3. 取消 ctrl+space 快捷键

## 软件

1. 卸载 Onedrive
2. 安装 Chrome (配置 Surfingkeys 和 油猴)
3. 安装 QQ
4. 安装 Clash

## 主题

1. 设置中设为暗色
2. 安装[FiraCode font](https://github.com/tonsky/FiraCode/releases)

## 资源管理器

1. 显示拓展名和隐藏文件

## 其他

1. 删除 WINDOWS 管理员的权限提示：
   Setting -> Administrator -> Change user account control settings
2. 从 **硬件** 中使用脚本 cap2ctrl.reg，重启
3. 关闭 Windows 搜索中的热门搜索：
   ```PowerShell
   reg add HKCU\Software\Policies\Microsoft\Windows\explorer /v DisableSearchBoxSuggestions /t reg_dword /d 1 /f
   ```
4. 关闭公共防火墙以在 WSL2 中使用代理，使用管理员权限 PowerShell 输入以下命令允许 WSL2 通过防火墙
   ```PowerShell
     New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
   ```

# Git

先配置 Git Bash 后运行:

```sh
git config --global user.name "akhialomgir"
git config --global user.email “akhialomgir362856@gmail.com”
ssh-keygen
cat ~/.ssh/id_rsa.pub # 复制到 Github
```

# 7-Zip

`GUI`没有选编码功能，答案是手动改！

[修改windows的默认编码](https://blog.csdn.net/lee_ham/article/details/82634411)
