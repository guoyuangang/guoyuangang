#模型下载
import sys
from modelscope import snapshot_download

if len(sys.argv)!=2:
    print("请输入模型ID！")
else:
    snapshot_download(sys.argv[1],cache_dir='.')
