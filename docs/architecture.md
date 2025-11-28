# FOFO Studio 架构设计文档

## 系统架构概览

FOFO Studio 采用前后端分离的微服务架构，结合区块链与 AI 服务，构建虚实融合的平台。

## 架构图

```
┌─────────────────────────────────────────────────────────┐
│                     前端层 (Frontend)                     │
│  React/Next.js + Web3 + WebXR                            │
│  - The Market (电商)                                      │
│  - The Neural Mint (AI 生成)                             │
│  - Alpha DAO (社区)                                       │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                    API 网关层 (Gateway)                   │
│  Express.js / FastAPI                                    │
│  - 认证授权                                               │
│  - 请求路由                                               │
│  - 限流保护                                               │
└─────────────────────────────────────────────────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│  业务服务层   │  │   AI 服务层   │  │ 区块链服务层  │
│              │  │              │  │              │
│ - 用户服务    │  │ - SD API     │  │ - NFT 铸造   │
│ - 订单服务    │  │ - 图像处理    │  │ - 支付处理   │
│ - 产品服务    │  │ - 风格微调    │  │ - 版税分发   │
│ - 社区服务    │  │              │  │              │
└──────────────┘  └──────────────┘  └──────────────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────┐
│                   数据存储层 (Storage)                    │
│  PostgreSQL + Redis + IPFS/Arweave                       │
│  - 关系数据                                               │
│  - 缓存层                                                 │
│  - 去中心化存储                                            │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                  外部服务集成 (External)                  │
│  - Print on Demand 供应商 API                            │
│  - 物流追踪 API                                           │
│  - 邮件通知服务                                           │
└─────────────────────────────────────────────────────────┘
```

## 技术栈详细说明

### 前端技术栈

- **框架**: React 18+ / Next.js 14+
- **语言**: TypeScript
- **状态管理**: Zustand / Redux Toolkit
- **UI 组件库**: 自定义组件 + Tailwind CSS
- **Web3 集成**: 
  - ethers.js v6
  - wagmi hooks
  - RainbowKit (钱包连接)
- **3D/AR**: 
  - Three.js
  - React Three Fiber
  - 8th Wall (WebAR)
- **样式**: Tailwind CSS + 自定义 Cyberpunk 主题

### 后端技术栈

#### API 服务

- **Node.js 服务**:
  - Express.js
  - TypeScript
  - Prisma ORM
  - Bull (任务队列)

- **Python 服务** (AI 相关):
  - FastAPI
  - Celery (异步任务)
  - PyTorch (模型推理)

#### 数据库

- **PostgreSQL**: 主数据库
  - 用户数据
  - 订单数据
  - 产品数据
  - 社区内容

- **Redis**: 缓存与消息队列
  - Session 存储
  - API 限流
  - 实时数据缓存
  - 任务队列

#### 文件存储

- **IPFS**: NFT 元数据与图像存储
- **Arweave**: 永久存储关键数据
- **AWS S3 / Cloudflare R2**: 临时文件与备份

### 区块链基础设施

#### 网络选择

- **主链**: Polygon (低 Gas 费用)
- **备用链**: Arbitrum, Base

#### 智能合约

- **NFT 合约**: ERC-721 / ERC-1155
  - 铸造功能
  - 元数据管理
  - 版税设置

- **版税合约**: ERC-2981 标准实现

- **支付合约**: 
  - 多币种支付支持
  - 自动版税分发

#### 区块链交互

- **节点服务**: Alchemy / Infura / QuickNode
- **索引服务**: The Graph (可选)

### AI 服务架构

#### 模型部署

- **基础模型**: Stable Diffusion XL
- **微调模型**: LoRA 适配器
- **推理服务**: 
  - 本地 GPU 服务器 (优先)
  - Replicate API (备选)
  - Hugging Face Inference API (备选)

#### 图像处理流程

```
用户输入 Prompt
    ↓
风格增强 (添加 FOFO 风格关键词)
    ↓
调用 AI 模型生成 (4 个变体)
    ↓
后处理 (尺寸调整、质量优化)
    ↓
上传到 IPFS
    ↓
返回结果给用户
```

#### 风格数据集

- Cyberpunk 艺术图像
- Pixel Art 像素画
- Glitch Art 故障艺术
- Vaporwave 蒸汽波
- Meme 文化图像

### 实体制造集成

#### Print on Demand (POD) 供应商

- **Printful API**: 主要供应商
- **Printify API**: 备用供应商
- **自建工厂**: 未来扩展

#### 工作流程

```
用户下单
    ↓
生成生产规格文件 (SVG/PNG)
    ↓
调用 POD API 创建订单
    ↓
工厂打印制作
    ↓
物流发货
    ↓
用户收货，订单完成
```

## 安全架构

### 认证授权

- **Web3 认证**: MetaMask / WalletConnect
- **传统认证**: JWT Token
- **API 密钥**: 服务间通信

### 数据安全

- **加密传输**: HTTPS / WSS
- **敏感数据加密**: AES-256
- **数据库加密**: PostgreSQL 透明加密

### 智能合约安全

- **审计**: 第三方安全审计
- **测试**: 完整的单元测试与集成测试
- **漏洞奖励**: Bug Bounty 计划

## 性能优化

### 前端优化

- **代码分割**: 路由级别的懒加载
- **图片优化**: WebP 格式 + 懒加载
- **CDN 加速**: Cloudflare / Vercel Edge

### 后端优化

- **缓存策略**: Redis 缓存热点数据
- **数据库优化**: 索引优化 + 查询优化
- **负载均衡**: Nginx / Cloudflare Load Balancer

### AI 服务优化

- **模型量化**: 降低推理延迟
- **批量处理**: 合并请求提高吞吐
- **GPU 加速**: CUDA 加速推理

## 监控与日志

### 监控系统

- **APM**: Sentry (错误追踪)
- **性能监控**: New Relic / Datadog
- **区块链监控**: Tenderly / Blocknative

### 日志系统

- **集中式日志**: ELK Stack / Loki
- **日志级别**: DEBUG, INFO, WARN, ERROR
- **日志保留**: 30 天

## 部署架构

### 开发环境

- **本地开发**: Docker Compose
- **测试环境**: 独立的测试服务器

### 生产环境

- **容器化**: Docker + Kubernetes (可选)
- **云服务商**: AWS / Vercel / Railway
- **CI/CD**: GitHub Actions

### 高可用设计

- **多区域部署**: 主从数据库
- **服务冗余**: 多实例负载均衡
- **故障转移**: 自动切换备用服务

## 扩展性设计

### 水平扩展

- **无状态服务**: 易于横向扩展
- **数据库分片**: 按用户 ID 分片
- **CDN 分发**: 静态资源全球分发

### 垂直扩展

- **GPU 服务器**: AI 服务可升级 GPU
- **数据库升级**: 可扩展数据库配置

## API 设计规范

### RESTful API

```
GET    /api/v1/products         # 获取产品列表
GET    /api/v1/products/:id     # 获取产品详情
POST   /api/v1/orders           # 创建订单
GET    /api/v1/orders/:id       # 获取订单状态
POST   /api/v1/ai/generate      # AI 生成图像
POST   /api/v1/nft/mint         # 铸造 NFT
```

### GraphQL API (可选)

用于复杂查询场景，如社区内容聚合。

## 数据模型

### 核心实体

- **User**: 用户信息 + 钱包地址
- **Product**: 产品信息 + NFT 元数据
- **Order**: 订单信息 + 区块链交易哈希
- **NFT**: NFT 合约地址 + Token ID
- **Community**: 社区内容 + 积分记录

详细的数据模型设计见数据库 Schema 文档。

