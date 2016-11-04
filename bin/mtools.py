#!/usr/bin/env python3

import sys,os,subprocess,re
from threading import Thread

def stderr_print(msg):
    """标准错误输出"""
    sys.stderr.write(msg)

def path_deal(path_bytes):
    """递归处理路径"""
    if type(path_bytes) == str:
        path_bytes =path_bytes.encode("utf8")
    # print("pathdeal",path_bytes.decode())
    # if not os.path.exists(path_bytes):
    #     print("not exists: ",path_bytes.decode())

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
        #处理　dir ,重命名到"/原名"的错误
        # print("dirname",dirname_bytes.decode(),"realname",realname_bytes.decode())
        if dirname_bytes != "".encode():
            realpath=dirname_bytes+os.sep.encode("utf8")+realname_bytes
        else:
            realpath=realname_bytes       
        print("Processing path: \'{}\'".format(realpath.decode("utf8")))
        if path_bytes != realpath:
            os.rename(path_bytes,realpath)
    finally:
        if os.path.isdir(path_bytes):
            # print("isdir",path_bytes.decode())
            for i in os.listdir(path_bytes):
                #不知为什么目录后有的／,有的没有，但//没影响,不管了
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
            for ii,i in enumerate(fi.readlines()):
                try:
                    tmp=i.decode("gbk")
                    fo.write(tmp)
                    print("GBK decode succeed: ",tmp)
                except UnicodeDecodeError:
                    stderr_print("\'{}\' not GBK and try to decode to utf8: {}".format(ii,i.decode("utf8")))
                    tmp=i.decode("utf8")
                    fo.write(tmp)
                    print("utf8 decode succeed: ",tmp)
                    continue
        # except UnicodeDecodeError:
        #     stderr_print("Is'not GBK file: \"{}\"\n".format(path))
        finally:
            fo.flush()
            fo.close()

class ping_list:
    """ping class"""
    def __init__(self,url,count,*otherargs):
        self.url=url
        self.count=count

    def ping(self):
        """ping method"""
        try:
            out_bytes = subprocess.check_output(['ping','-c',str(self.count),self.url],stderr=subprocess.STDOUT).decode()
            #取结果最后几行的总结
            out=out_bytes.split("\n")[-3:]
            global resultdict
            # print(url.url,": ",out)
            resultdict.setdefault(self.url,out)        
        except subprocess.TimeoutExpired as e:
            stderr_print(str(e))
            exit(-1)
        except subprocess.CalledProcessError as e:
            stderr_print(str(e))
            exit(-1)

#ping 单子进程太浪费时间了
#ping子进程列表，ping结果字典
sublist=[]
resultdict={}
if sys.argv[1].startswith("-p"):
    #默认ping 的次数
    count=3
    if len(sys.argv[1])>2:
        try:
            tmpcount=int(sys.argv[1][2:])
        except ValueError as e:
            stderr_print(str(e))
            exit(-1)
        else:
            count=tmpcount

    for i in sys.argv[2:]:
        tmp=ping_list(i,count)
        tmp_thread=Thread(target=lambda: tmp.ping() )
        tmp_thread.start()
        sublist.append(tmp_thread)

    for ii,i in enumerate(sublist):
        # print(ii,": ",i)
        i.join()
    
    for k,v in resultdict.items():
        #切掉最后的空字符串，并按照最长的ip4地址右对齐
        print("{:>16}: {} {}".format(k,*v[:-1]))

#use "-f" option 去处理ＧＢＫ编码的文本文件
elif sys.argv[1]=="-f":
    for i in sys.argv[2:]:
        file_deal(i)

#默认处理含GBK编码子路径的目录，注意纯gbk路径参数不能正确识别,只能置于正常目录下
elif sys.argv[1]=="-g":
    for everypath in sys.argv[2:]:
        if not os.path.exists(everypath):
            stderr_print("\"{}\" {}".format(everypath,"is not exist and skip !"))
            continue
        path_deal(everypath)

else:
    stderr_print("Hasn't this option : ".format(sys.argv[1]))
    exit(-1)