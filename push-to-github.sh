#!/bin/bash

# FOFO Studio - 推送到 GitHub 脚本
# 使用方法: ./push-to-github.sh YOUR_GITHUB_USERNAME

if [ -z "$1" ]; then
    echo "❌ 错误: 请提供你的 GitHub 用户名"
    echo "使用方法: ./push-to-github.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="fofo-studio"

echo "🚀 准备推送 FOFO Studio 到 GitHub..."
echo "📦 仓库: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

# 检查是否已有远程仓库
if git remote | grep -q "origin"; then
    echo "⚠️  检测到已存在的远程仓库，是否要更新？(y/n)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        git remote set-url origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    else
        echo "❌ 取消操作"
        exit 1
    fi
else
    # 添加远程仓库
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "✅ 已添加远程仓库"
fi

# 确保分支名为 main
git branch -M main

# 推送
echo ""
echo "📤 正在推送到 GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 成功！"
    echo "🌐 访问: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
else
    echo ""
    echo "❌ 推送失败，请检查："
    echo "   1. GitHub 仓库是否已创建"
    echo "   2. 是否已配置 GitHub 认证（Personal Access Token 或 SSH key）"
    echo "   3. 网络连接是否正常"
fi

