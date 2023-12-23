# WSL2

## WSL2 setup

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**Restart** and download the [core update for WSL2](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

## Install ArchWSL

[Install ArchWSL here](https://github.com/yuk7/ArchWSL/releases)

### 1. Unzip it in the **root directory of the C drive** and run **Arch.exe**

### 2. enable **Proxy** between Win and WSL

```PowerShell
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
New-NetFirewallRule -DisplayName "WSL2toHost" -Direction Inbound -InterfaceAlias "vEthernet (WSL)" -Action Allow -RemoteAddress LocalSubnet
```

### 3. Switch to WSL2

```PowerShell
wsl -l -v
wsl --set-version Arch 2
wsl -l -v
```

### 4. Update WSL

```PowerShell
wsl --update
```

## Reinstall ArchWSL

```PowerShell
wsl --unregister Arch
wslconfig /setdefault Arch
```
