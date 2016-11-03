#!/usr/bin/env python3

import sys,os

def stderr_print(msg):
    """标准错误输出"""
    sys.stderr.write(msg)

def path_deal(path_bytes):
    """递归处理路径"""
    if type(path_bytes) == str:
        path_bytes =path_bytes.encode("utf8")

    dirname_bytes=os.path.dirname(path_bytes)
    basename_bytes=os.path.basename(path_bytes)
    try:
        realname_bytes=basename_bytes.decode("gbk").encode("utf8")
    except UnicodeDecodeError:
            try:
                stderr_print("{}: \"{}\"{}".format("Is'not GBK and skip",path_bytes.decode("utf8"),"\n"))
            except UnicodeDecodeError:
                pass
    else:
        realpath=dirname_bytes+os.sep.encode("utf8")+realname_bytes        
        print("Processing path: \'{}\'".format(realpath.decode("utf8")))
        os.rename(path_bytes,realpath)
    finally:
        if os.path.isdir(path_bytes):
            for i in os.listdir(path_bytes):
                path_deal(path_bytes+os.sep.encode("utf8")+i)

def file_deal(path):
    """处理GBK编码的文本文件"""
    if not os.path.isfile(path):
        stderr_print("\"{}\" {}".format(path,"is not exist or not file !"))
        return
    with open(path,"rb") as fi:
        path_new=path+".new"
        if os.path.exists(path_new):
            stderr_print("\"{}\": Is exists and skip !\n".format(path_new))
            return
        try:
            fo=open(path_new,"w")
            for i in fi.readlines():
                tmp=i.decode("gbk")
                fo.write(tmp)
                print("Trans succeed: ",tmp)
        except UnicodeDecodeError:
            stderr_print("Is'not GBK file: \"{}\"\n".format(path))
        finally:
            fo.flush()
            fo.close()

#use "-f" option 去处理ＧＢＫ编码的文本文件
if sys.argv[1]=="-f":
    for i in sys.argv[2:]:
        file_deal(i)
    exit(0)

#默认处理含GBK编码子路径的目录，注意纯gbk路径参数不能正确识别,只能置于正常目录下
for everypath in sys.argv[1:]:
    if not os.path.exists(everypath):
        stderr_print("\"{}\" {}".format(everypath,"is not exist and skip !"))
        continue
    path_deal(everypath)
        