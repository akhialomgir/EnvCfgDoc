# Setup

## Git

Generate the key and copy

```sh
sudo pacman -S openssh
ssh-keygen -t rsa -C "akhialomgir362856@gmail.com"
cat ~/.ssh/id_rsa.pub

ssh -T git@gitee.com
```

## Jupyter

install:

```sh
sudo pacman -S python3 python-pip
# to use extensions
sudo pacman -S nodejs npm
pip -V
pip install jupyterlab
```

Setting up soft links:

```sh
sudo ln -s /mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe /usr/bin/firefox
firefox https://github.com/
sudo ln -s /mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe /usr/bin/chrome
chrome https://github.com/
```

config:

```sh
jupyter lab --generate-config
```

```py
# ~/.jupyter/jupyter_lab_config.py
import webbrowser
webbrowser.register('firefox',None,webbrowser.GenericBrowser('/usr/bin/firefox'))
c.NotebookApp.browser = 'firefox'
c.ServerApp.use_redirect_file = False
```

extensions:
```sh
# install jupyterlab_onedarkpro
jupyter lab build --dev-build=False --minimize=False
```

When creating files:

> Error Unexpected error while saving file: xxx.ipynb [Errno 13] Permission denied: '/home/akhia/Code/xxx/.ipynb_checkpoints/xxx-checkpoint.ipynb'

When openning files:

> File Load Error for Untitled.ipynb Unhandled error

```sh
ls -la
sudo chown akhia .ipynb_checkpoints
# apply the following command to the whole workspace 
chown -R akhia:akhia *
```
