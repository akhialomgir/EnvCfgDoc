# WSL

## WSL2 setup

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**Restart** and download the [core update for WSL2](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

## Firewall blocks access(WSL2)

Run PowerShell with Admin

```PowerShell
New-NetFirewallRule -DisplayName "WSL2toHost" -Direction Inbound -InterfaceAlias "vEthernet (WSL)" -Action Allow -RemoteAddress LocalSubnet
```
