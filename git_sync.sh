#!/bin/sh

cd /share/CACHEDEV1_DATA/docker/cf_iptest/results

# 检查是否有文件变更
if [ -n "$(git status --porcelain)" ]; then
    # 添加所有变更
    git add .
    
    # 提交变更
    git commit -m "Auto-Sync: $(date "+%Y-%m-%d %H:%M:%S")"
    
    # 推送到GitHub
    git push
    
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Success: Results pushed to GitHub." >> /share/CACHEDEV1_DATA/docker/cf_iptest/git_sync.log
else
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Info: No changes in results." >> /share/CACHEDEV1_DATA/docker/cf_iptest/git_sync.log
fi