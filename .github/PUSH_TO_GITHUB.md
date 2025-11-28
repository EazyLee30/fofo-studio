# 如何将项目推送到 GitHub

## 步骤 1: 在 GitHub 上创建仓库

1. 访问 [GitHub](https://github.com) 并登录
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库信息：
   - **Repository name**: `fofo-studio`
   - **Description**: `For Others, For Ourselves - A Web3 + AIGC + Culture Platform`
   - **Visibility**: Public（公开）或 Private（私有）
   - **不要**勾选 "Initialize this repository with a README"（我们已经有了）
4. 点击 "Create repository"

## 步骤 2: 连接本地仓库到 GitHub

在终端中执行以下命令（将 `YOUR_USERNAME` 替换为你的 GitHub 用户名）：

```bash
cd /Users/eazylee/build/fofo-studio

# 添加远程仓库
git remote add origin https://github.com/YOUR_USERNAME/fofo-studio.git

# 或者使用 SSH（如果你配置了 SSH key）
# git remote add origin git@github.com:YOUR_USERNAME/fofo-studio.git

# 查看远程仓库配置
git remote -v
```

## 步骤 3: 推送到 GitHub

```bash
# 推送主分支到 GitHub
git branch -M main
git push -u origin main
```

如果遇到认证问题，你可能需要：
- 使用 Personal Access Token（PAT）替代密码
- 或者配置 SSH key

## 步骤 4: 验证

访问 `https://github.com/YOUR_USERNAME/fofo-studio` 查看你的仓库！

## 后续更新

之后每次更新代码，使用以下命令：

```bash
git add .
git commit -m "你的提交信息"
git push
```

## 可选：添加 GitHub Actions

可以添加 CI/CD 工作流、自动部署等。参考 `.github/workflows/` 目录（如果存在）。

