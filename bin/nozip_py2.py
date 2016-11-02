#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import os
import sys
import zipfile

def mkextractdir(zipfile):
    """创建解压目标目录"""
    extractdir=zipfile[:-4]
    if  extractdir == "":
        stderr_print("\"{}\" {}".format(everyfile,"is not has \".zip\" ext-name !"))

    if os.path.exists(extractdir) and  not os.path.isdir(extractdir):
        stderr_print("\"{}\" {}".format(everyfile,"already is exists and not a dir , exit !!"))

    if not os.path.exists(extractdir):
        os.mkdir(extractdir)
        print "\"",extractdir, "\" index created 。"

    return extractdir

def processzip(everyfile):
    """处理ｚｉｐ文件"""
    print "Py2 Processing File " + everyfile
    with zipfile.ZipFile(everyfile,"r") as file:
        extractdir=mkextractdir(everyfile)
        for name in file.namelist():
            realname=name.decode("gbk").encode("utf8")
            #decode后是unicode,encode后是str，print()是py3的，unicode显示时不解码。
            realpath=extractdir+os.sep+realname
            print "Extracting to:"+ realpath
            realpathdir=os.path.dirname(realpath)
            if not os.path.exists(realpathdir) and realpathdir !="":
                os.makedirs(realpathdir)
            data=file.read(name)

            if not os.path.exists(realpath):
                #目录会已经存在
                fo=open(realpath,"w")
                fo.write(data)
                fo.close()

def stderr_print(msg):
    """标准错误输出&退出"""
    sys.stderr.write(msg)
    exit(-1)

for everyfile in sys.argv[1:]:
    """依次处理每个文件,处理路径不存在。"""
    if not os.path.exists(everyfile):
        stderr_print("\"{}\" {}".format(everyfile,"is not exist !"))
    try:
        processzip(everyfile)
    except UnicodeEncodeError:
        stderr_print("\"{}\" {}".format(everyfile,"zip_namelist is'not gbk encode characters !"))
    except zipfile.BadZipfile:
        stderr_print("\"{}\" {}".format(everyfile,"is'not a zip file !"))
