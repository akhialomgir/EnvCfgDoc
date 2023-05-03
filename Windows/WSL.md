# WSL

## WSL2 setup

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```



**Restart** and download the [core update for WSL2](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
