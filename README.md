# 服务器管理工具 (Server-Management)

<!-- Server-Management: Tools and scripts for efficient server maintenance and administration. -->
服务器管理员在日常维护服务器时可能会用到的一些脚本和工具

## 一些常用脚本

- [add_user_15.sh](./scripts/add_user_15.sh)

    在15服务器上开新账号

```bash
# 首先将用户的公钥上传至某个文件夹, 脚本中以/data15/data15_5/guangxing/temp为例
# 记得修改脚本中的 pub_dir, 如有需要还可以修改 user_home

# 用法: <username> 为用户名, <group> 为用户所属组名，如果组不存在则自动创建该组
sudo bash add_user_15.sh <username> <group>

# 一个例子, 给22级张三开账号, 所属组为enroll2022:
sudo bash add_user_15.sh zhangsan enroll2022
```

- [show_disk_usage.sh](./scripts/show_disk_usage.sh)

    统计某个目录下各文件(夹)所占空间并排序输出, 可以用来统计该服务器上每个人所用空间大小

```bash
# 用法: [sudo] 可选，如果要统计的文件夹中有你的账号没有足够权限访问的文件则需要
# <directory> 为统计目录, <depth> 为最大递归深度
[sudo] bash show_disk_usage.sh [<directory>] [<depth>]

# 2个例子:
# 统计自己家目录下递归深度最大为2的所有文件大小, 结果会同时输出到 ~/disk_rec/ 下
bash show_disk_usage.sh ~ 2
# 统计 /data15/data15_5/ 下所有用户所占空间大小, 结果会同时输出到 /root/disk_rec/ 下
sudo bash show_disk_usage.sh /data15/data15_5/ 1
```

- [gpu_debug.sh](./scripts/gpu_debug.sh)

    显卡出问题时输出一些信息帮助debug

```bash
# 输出的信息写得很明白了, 这里就不过多解释
bash gpu_debug.sh 
```

## TODO

待更新: 
- 服务器资源监视网站源码
- 内网穿透相关
- 其他服务器相关