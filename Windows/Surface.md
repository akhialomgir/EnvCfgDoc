# Surface

## Fix brightness auto-adjustment issue

regedit path:

```
[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000]
```

modify value of "FeatureTestControl":

```
"FeatureTestControl"=dword:00009240->00009250
```
