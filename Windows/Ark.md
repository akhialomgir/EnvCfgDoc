# Ark

Install [BlueStacks](https://www.bluestacks.cn/)

Setting -> Advanced -> ADB Debugging

Download [Arknights](https://ak.hypergryph.com/)

Download [MAA](https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases)

## [蓝叠模拟器 Hyper-V 版本](https://support.bluestacks.com/hc/zh-tw/articles/4415238471053-BlueStacks-5-%E6%94%AF%E6%8F%B4-Hyper-V-%E7%9A%84-Windows-10-%E5%92%8C-11-%E4%B8%8A%E7%9A%84%E9%9B%BB%E8%85%A6%E8%A6%8F%E6%A0%BC%E9%9C%80%E6%B1%82)

- 需要在模拟器 `设定` - `进阶` 中打开 `Android调试桥`。
- 由于蓝叠 Hyper-V 版本的端口号在不断变动，所以留了个专用的小后门：

    1. 在蓝叠模拟器的数据目录下找到 `bluestacks.conf` 这个文件，

       - 中国内地版默认路径为 `C:\ProgramData\BlueStacks_nxt_cn\bluestacks.conf`

    2. 如果是第一次使用，请开启一次 MAA，会在 MAA 的 `config` 目录下生成 `gui.json`。
    3. **先关闭** MAA，**然后** 打开 `gui.json`，新增一个字段 `Bluestacks.Config.Path`，填入 `bluestacks.conf` 的完整路径。（注意斜杠要用转义 `\\`）<br>
    示例：（以 `C:\ProgramData\BlueStacks_nxt_cn\bluestacks.conf` 为例）

        ```jsonc
        "Bluestacks.Config.Path":"C:\\ProgramData\\BlueStacks_nxt_cn\\bluestacks.conf",
        ```

Install **Python in Windows**, add **ENV** and **requirements**
Install Git in Windows

```sh
git clone https://github.com/akhialomgir/psychic-octo-umbrella.git

C:\Program Files\Python\Python38
C:\Program Files\Python\Python38\Scripts

python -m pip install --upgrade pip --user
pip install requests
```