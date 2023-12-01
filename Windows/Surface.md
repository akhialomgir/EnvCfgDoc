# Surface

## Fix brightness auto-adjustment issue

Modify value of "FeatureTestControl":

```reg
REGEDIT4

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000]
"FeatureTestControl"=dword:00009250
```
