# Cloud-home-Page
此项目用于放置个人七零八落的配置文件。

## Cloud home Page
浏览器首页,新标签页。

## mpv
MPV 播放器配置文件。

## config.fish
fish 配置文件。

## .conky.rc
conky 配置文件,附预览图。

依赖:lm_sensors

获取CPU/GPU的温度,在我的机器上GPU（核显）温度获取不到。

## bin/mtools.py
处理路径名/文件GBK编码导致的乱码，并行ping小工具，基于Py3编写(不兼容Py2)。

### -g 选项

最初是为了解决ZIP解压GBK乱码的问题，后发现ZIP解压只是路径(目录和文件名)乱码，且ZIP有各种操作，比如支持密码等。
遂直接处理GBK乱码的路径(unzip解压出的),对路径重命名，使用范围更广。

* 注意参数只能是正常的目录(其下包含乱码路径，乱码命令行参数不能正常识别。

* 部分非GBK编码的字符也能用GBK解码，请对比结果和源，其中ASCII无不良后果，因为它是大部分编码格式的子集，其中包括GBK,UTF8等　

### -f 选项

处理GBK编码的文本文件，同路径下生成扩展名为”.new“的文件（若已经存在则跳过）。

* 注意参数只能是文件

* 部分非GBK编码的字符也能用GBK解码，请对比结果和源，其中ASCII无不良后果，因为它是大部分编码格式的子集，其中包括GBK,UTF8等　

### -p[c] 选项

Ping 域名或者ip,注意不含http等协议，或者根路径之外的路径,所花时间取决于花时间最长的那个。

c为可选参数，即Ping的次数(count),默认为３

结果的格式化与排序有空再做

### 使用: 

        bin/mtools.py　-g  dir1　dir2 ... dirN
        bin/mtools.py  -f  file1 file2 ...dirN
        bin/mtools.py  -p[c]  domain1/ip1 domain2/ip2 domainN/ipN

