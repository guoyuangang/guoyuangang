import os
import sys
from huggingface_hub import snapshot_download, login as hf_login

# hf_login("HF_TOKEN")
# export HF_ENDPOINT=https://hf-mirror.com

if os.environ['HF_ENDPOINT'] != "https://hf-mirror.com":
    print("os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'")

if len(sys.argv)!=2:
    print("请输入模型ID！")
else:
    snapshot_download(sys.argv[1], cache_dir=".")


