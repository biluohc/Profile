# Cloud-home-Page
此项目用于放置个人七零八落的配置文件.

## Cloud home Page
浏览器首页,新标签页.

## mpv
MPV 播放器配置文件.

## config.fish
fish 配置文件.

## .conky.rc
conky 配置文件,附预览图.

## bin/no_gbk3.py
处理目录/文件GBK编码导致的乱码

最初是为了解决ZIP解压GBK乱码的问题，后发现ZIP解压只是路径(目录和文件名)乱码，且ZIP有各种操作，比如支持密码等。
遂直接处理GBK乱码的路径(unzip解压出的),对路径重命名，使用范围更广。

另添加　-f 选项，处理GBK编码的文本文件，同路径下生成扩展名为”.new“的文件（若已经存在则跳过）。

注意第一个功能参数只能是正常的目录(其下包含乱码路径，乱码命令行参数不能正常识别)，

第二个功能则参数只能是文件，且一次只能用一个功能，但能处理多个目录或文件。

### 使用: 

        bin/no_gbk3.py　dir1　dir2 ... dirN
        bin/no_gbk3.py  -f  file1 file2 ...dirN

