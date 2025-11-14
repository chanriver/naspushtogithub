# Cloudflare IP 测速工具

一个自动化的 Cloudflare IP 测速工具，部署在威联通 NAS 上，定期测试 Cloudflare IP 延迟并生成最优结果。

## 🚀 功能特性

- **📡 全网测速**：对 Cloudflare 所有 IP 段进行延迟测试
- **🏆 智能筛选**：自动生成延迟最低的 20 个优质 IP
- **🌍 地理位置**：显示 IP 对应的国家国旗和延迟数据
- **⏰ 定时执行**：每天固定时段自动测速，确保结果时效性
- **☁️ 自动同步**：测速结果自动推送至 GitHub 仓库

## 📁 项目结构
```
cf_iptest/

├── run_speedtest.sh          # 主测速脚本

├── results/

│   ├── git_sync.sh          # Git 同步脚本

│   └── results.txt          # 测速结果文件

├── CFIPV4.txt              # Cloudflare IP 段列表

├── GeoLite2-Country.mmdb   # IP 地理位置数据库

└── git_sync.log           # 同步日志
```


## ⚙️ 部署要求

### 前提条件

1. **IP 段文件**：下载 Cloudflare 所有 IP 段，保存为 `CFIPV4.txt`
2. **地理数据库**：下载 `GeoLite2-Country.mmdb` 用于 IP 国家识别
3. **威联通 NAS**：确保有足够的存储空间和网络带宽

### 文件准备
IP 段文件格式示例
173.245.48.0/20

103.21.244.0/22

103.22.200.0/22
## 🛠️ 安装配置

### 1. 文件部署

将项目文件上传至威联通 NAS
### 2. 脚本授权


chmod +x ./run_speedtest.sh

chmod +x ./git_sync.sh
### 3. 定时任务配置

通过威联通 NAS 的 crontab 设置定时任务：
编辑定时任务
crontab -e

添加以下任务
0 2,14 * * * /bin/bash ./run_speedtest.sh

0 3,15 * * * /bin/sh ./results/git_sync.sh
**任务说明：**
- **02:00, 14:00**：执行 Cloudflare IP 测速
- **03:00, 15:00**：自动同步结果到 GitHub

## 📊 输出结果

测速结果保存在 `results/results.txt`，格式如下：
以下是为您的项目整理的 GitHub README.md 内容：

markdown
复制
# Cloudflare IP 测速工具

一个自动化的 Cloudflare IP 测速工具，部署在威联通 NAS 上，定期测试 Cloudflare IP 延迟并生成最优结果。

## 🚀 功能特性

- **📡 全网测速**：对 Cloudflare 所有 IP 段进行延迟测试
- **🏆 智能筛选**：自动生成延迟最低的 20 个优质 IP
- **🌍 地理位置**：显示 IP 对应的国家国旗和延迟数据
- **⏰ 定时执行**：每天固定时段自动测速，确保结果时效性
- **☁️ 自动同步**：测速结果自动推送至 GitHub 仓库

## 📁 项目结构
cf_iptest/

├── run_speedtest.sh          # 主测速脚本

├── results/

│   ├── git_sync.sh          # Git 同步脚本

│   └── results.txt          # 测速结果文件

├── CFIPV4.txt              # Cloudflare IP 段列表

├── GeoLite2-Country.mmdb   # IP 地理位置数据库

└── git_sync.log           # 同步日志

复制
## ⚙️ 部署要求

### 前提条件

1. **IP 段文件**：下载 Cloudflare 所有 IP 段，保存为 `CFIPV4.txt`
2. **地理数据库**：下载 `GeoLite2-Country.mmdb` 用于 IP 国家识别
3. **威联通 NAS**：确保有足够的存储空间和网络带宽

### 文件准备


### IP 段文件格式示例

```
173.245.48.0/20

103.21.244.0/22

103.22.200.0/22

...
```


## 🛠️ 安装配置

### 1. 文件部署

将项目文件上传至威联通 NAS：


```
./cf_iptest/
```

复制
### 2. 脚本授权
```
chmod +x ./run_speedtest.sh

chmod +x ./results/git_sync.sh

```

### 3. 定时任务配置

通过威联通 NAS 的 crontab 设置定时任务：

```
#编辑定时任务
crontab -e

#添加以下任务
0 2,14 * * * ./run_speedtest.sh

0 3,15 * * * /bin/sh ./results/git_sync.sh
```


**任务说明：**

- **02:00, 14:00**：执行 Cloudflare IP 测速
- **03:00, 15:00**：自动同步结果到 GitHub

## 📊 输出结果

测速结果保存在 `results/results.txt`，格式如下：
🚀 Cloudflare 最优 IP 列表
📅 最后更新: 2025-01-20 14:00:00
🌍 基于延迟自动排序 (前20名)

```
104.28.40.100 #🇺🇸 美国 - 12ms

172.67.68.200 #🇸🇬 新加坡 - 15ms

104.22.76.100 #🇯🇵 日本 - 18ms

...

104.27.40.100 #🇭🇰 香港 - 25ms
```



## 🔧 核心脚本

### run_speedtest.sh
- 执行 IP 段延迟测试
- 筛选最优 20 个 IP
- 添加国家国旗标识
- 生成格式化结果

### git_sync.sh
- 自动检测文件变更
- 提交更新到 Git
- 推送到远程仓库
- 记录操作日志

## 📈 监控维护

### 查看运行状态
检查定时任务
crontab -l
查看同步日志
tail -f ./git_sync.log
验证 Git 同步状态
cd ./results
git status

## 🎯 使用场景

- **网络优化**：为自建 CDN 选择最优 Cloudflare IP
- **网络监控**：长期监测网络到 Cloudflare 的质量
- **数据备份**：自动备份测速结果和历史数据
- **地理位置分析**：分析不同地区到 Cloudflare 的连接质量

## 📝 更新日志

- **2025-11-13**：项目初始版本发布
- 支持自动化测速和结果同步
- 集成国家识别和国旗显示
- 威联通 NAS 部署优化