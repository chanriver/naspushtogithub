#!/bin/sh

cd /share/CACHEDEV1_DATA/docker/cf_iptest/results

LOG_FILE="/share/CACHEDEV1_DATA/docker/cf_iptest/git_sync.log"

# 记录执行时间
echo "[$(date "+%Y-%m-%d %H:%M:%S")] Git sync check started" >> "$LOG_FILE"

# 先拉取最新更改（避免冲突）
git pull --ff-only >/dev/null 2>&1

# 检查是否有文件变更
if [ -n "$(git status --porcelain)" ]; then
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Changes detected, committing and pushing..." >> "$LOG_FILE"
    
    # 添加所有变更
    git add .
    
    # 提交变更
    git commit -m "Auto-Sync: $(date "+%Y-%m-%d %H:%M:%S")"
    
    # 推送到GitHub
    if git push; then
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] Success: Changes pushed to GitHub" >> "$LOG_FILE"
    else
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] Error: Failed to push changes" >> "$LOG_FILE"
    fi
else
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Info: No changes to commit" >> "$LOG_FILE"
fi