# -*- coding: utf-8 -*-
import os
import re


def get_category(data):
    res = re.findall(r"category:\s?(.+?)\s", data)
    return res[0] if res else None

def get_tags(data=""):
    res = re.findall(r"tags:\s?(.+?)\n", data)
    res = res[0] if res else None
    return res.split(" ") if res else None


def readFile(newDir):
    filepath = newDir
    filename=os.path.split(newDir)[1]
    print filepath , filename
    data = get_file_data(filepath) or ""
    if data.find("tags") == -1:
        insert_tags(filepath, 4, "tags: %s\n" % get_category(data))

def insert_tags(filepath, LINE, data):
    fp = open(filepath)  # 返回一个文件对象
    lines = []
    for line in fp:  # 内置的迭代器, 效率很高
        lines.append(line)
    fp.close()

    lines.insert(LINE, data)  # 在第 LINE+1 行插入
    s = ''.join(lines)
    fp = open(filepath, 'wb')  # 返回一个文件对象
    fp.write(s)
    fp.close()



def get_file_data(filepath):
    f = open(filepath)  # 返回一个文件对象
    data = ""
    for i in range(8):
        # print(line, end = '')　　　# 在 Python 3中使用
        line = f.readline()
        data += line
        if not line:
            break

    f.close()
    return data



def eachFile(filepath):
    pathDir = os.listdir(filepath)      #获取当前路径下的文件名，返回List
    for s in pathDir:
        newDir=os.path.join(filepath,s)     #将文件命加入到当前文件路径后面
        if os.path.isfile(newDir) :         #如果是文件
            if os.path.splitext(newDir)[1]==".md":  #判断是否是txt
                readFile(newDir)                     #读文件
                pass
        else:
            eachFile(newDir)                #如果不是文件，递归这个文件夹的路径
def a():
    str = """---
layout: post
category: Algorithms
title: 算法的比较
---
"""


if __name__ == '__main__':
    eachFile("/Users/mafulong/mafulong.github.io/_posts/")
    # get_tags()
