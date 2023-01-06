# WSL

## WSL2 setup

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

wsl --set-version Ubuntu-20.04 2
wsl -l -v
```

## Jupyter

install:

```sh
sudo pacman -S jupyterlab
```

config:

```py
import webbrowser
webbrowser.register('chrome',None,webbrowser.GenericBrowser('/usr/bin/chrome'))
c.NotebookApp.browser = 'chrome'
c.ServerApp.use_redirect_file = False
```
