# btrace

## 简介

btrace：binder_transaction+eBPF+Golang实现通用的Android APP动态行为追踪工具。

方案说明：https://bbs.kanxue.com/thread-281895.htm

## 编译

ARM64的Linux环境中，需要先安装Golang开发环境，然后：

```shell
git clone https://github.com/null-luo/btrace.git
cd btrace
make # 编译btrace 預設為arm64 架構
make TARGET=amd64 # 编译btrace为amd64 架構
```

![1717907826094](image/README/1717907826094.png)

## 运行

真机或者ARM模拟器都可以：

1. 推送到手機
```shell
adb push out/btrace_arm64 /data/local/tmp/btrace

```

2. 進入手機 & root權限
```shell
adb shell
su
```

2. 执行btrace
```shell
cd /data/local/tmp
chmod +x btrace
./btrace
```

![1717908085506](image/README/1717908085506.png)

![1717908229782](image/README/1717908229782.png)
