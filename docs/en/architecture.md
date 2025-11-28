# FOFO Studio Architecture Design Document

## System Architecture Overview

FOFO Studio adopts a frontend-backend separated microservices architecture, combining blockchain and AI services to build a phygital platform.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                  Frontend Layer                           │
│  React/Next.js + Web3 + WebXR                            │
│  - The Market (E-commerce)                               │
│  - The Neural Mint (AI Generation)                       │
│  - Alpha DAO (Community)                                 │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                  API Gateway Layer                        │
│  Express.js / FastAPI                                    │
│  - Authentication & Authorization                        │
│  - Request Routing                                       │
│  - Rate Limiting                                         │
└─────────────────────────────────────────────────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│ Business     │  │ AI Service    │  │ Blockchain   │
│ Service      │  │ Layer         │  │ Service      │
│              │  │              │  │              │
│ - User Svc   │  │ - SD API     │  │ - NFT Mint   │
│ - Order Svc  │  │ - Image Proc │  │ - Payment    │
│ - Product    │  │ - Style Tune │  │ - Royalty    │
│ - Community  │  │              │  │              │
└──────────────┘  └──────────────┘  └──────────────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────┐
│                  Data Storage Layer                      │
│  PostgreSQL + Redis + IPFS/Arweave                      │
│  - Relational Data                                       │
│  - Cache Layer                                           │
│  - Decentralized Storage                                 │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                  External Service Integration            │
│  - Print on Demand Supplier API                         │
│  - Logistics Tracking API                               │
│  - Email Notification Service                           │
└─────────────────────────────────────────────────────────┘
```

## Detailed Tech Stack

### Frontend Tech Stack

- **Framework**: React 18+ / Next.js 14+
- **Language**: TypeScript
- **State Management**: Zustand / Redux Toolkit
- **UI Component Library**: Custom components + Tailwind CSS
- **Web3 Integration**: 
  - ethers.js v6
  - wagmi hooks
  - RainbowKit (Wallet Connection)
- **3D/AR**: 
  - Three.js
  - React Three Fiber
  - 8th Wall (WebAR)
- **Styling**: Tailwind CSS + Custom Cyberpunk Theme

### Backend Tech Stack

#### API Services

- **Node.js Service**:
  - Express.js
  - TypeScript
  - Prisma ORM
  - Bull (Task Queue)

- **Python Service** (AI Related):
  - FastAPI
  - Celery (Async Tasks)
  - PyTorch (Model Inference)

#### Database

- **PostgreSQL**: Main Database
  - User data
  - Order data
  - Product data
  - Community content

- **Redis**: Cache & Message Queue
  - Session storage
  - API rate limiting
  - Real-time data cache
  - Task queue

#### File Storage

- **IPFS**: NFT metadata and image storage
- **Arweave**: Permanent storage for critical data
- **AWS S3 / Cloudflare R2**: Temporary files and backups

### Blockchain Infrastructure

#### Network Selection

- **Main Chain**: Polygon (Low Gas Fees)
- **Backup Chains**: Arbitrum, Base

#### Smart Contracts

- **NFT Contract**: ERC-721 / ERC-1155
  - Minting functionality
  - Metadata management
  - Royalty settings

- **Royalty Contract**: ERC-2981 Standard Implementation

- **Payment Contract**: 
  - Multi-currency payment support
  - Automatic royalty distribution

#### Blockchain Interaction

- **Node Services**: Alchemy / Infura / QuickNode
- **Indexing Service**: The Graph (Optional)

### AI Service Architecture

#### Model Deployment

- **Base Model**: Stable Diffusion XL
- **Fine-tuned Model**: LoRA Adapter
- **Inference Service**: 
  - Local GPU Server (Priority)
  - Replicate API (Alternative)
  - Hugging Face Inference API (Alternative)

#### Image Processing Flow

```
User Input Prompt
    ↓
Style Enhancement (Add FOFO style keywords)
    ↓
Call AI Model Generation (4 variants)
    ↓
Post-processing (Size adjustment, quality optimization)
    ↓
Upload to IPFS
    ↓
Return Results to User
```

#### Style Dataset

- Cyberpunk art images
- Pixel Art
- Glitch Art
- Vaporwave
- Meme culture images

### Physical Manufacturing Integration

#### Print on Demand (POD) Suppliers

- **Printful API**: Primary supplier
- **Printify API**: Backup supplier
- **Self-built Factory**: Future expansion

#### Workflow

```
User Places Order
    ↓
Generate Production Spec File (SVG/PNG)
    ↓
Call POD API to Create Order
    ↓
Factory Printing & Production
    ↓
Logistics Shipping
    ↓
User Receives, Order Complete
```

## Security Architecture

### Authentication & Authorization

- **Web3 Authentication**: MetaMask / WalletConnect
- **Traditional Authentication**: JWT Token
- **API Keys**: Inter-service communication

### Data Security

- **Encrypted Transmission**: HTTPS / WSS
- **Sensitive Data Encryption**: AES-256
- **Database Encryption**: PostgreSQL Transparent Encryption

### Smart Contract Security

- **Audit**: Third-party security audit
- **Testing**: Complete unit tests and integration tests
- **Bug Bounty**: Bug Bounty Program

## Performance Optimization

### Frontend Optimization

- **Code Splitting**: Route-level lazy loading
- **Image Optimization**: WebP format + lazy loading
- **CDN Acceleration**: Cloudflare / Vercel Edge

### Backend Optimization

- **Caching Strategy**: Redis cache for hot data
- **Database Optimization**: Index optimization + query optimization
- **Load Balancing**: Nginx / Cloudflare Load Balancer

### AI Service Optimization

- **Model Quantization**: Reduce inference latency
- **Batch Processing**: Merge requests to improve throughput
- **GPU Acceleration**: CUDA-accelerated inference

## Monitoring & Logging

### Monitoring System

- **APM**: Sentry (Error Tracking)
- **Performance Monitoring**: New Relic / Datadog
- **Blockchain Monitoring**: Tenderly / Blocknative

### Logging System

- **Centralized Logging**: ELK Stack / Loki
- **Log Levels**: DEBUG, INFO, WARN, ERROR
- **Log Retention**: 30 days

## Deployment Architecture

### Development Environment

- **Local Development**: Docker Compose
- **Test Environment**: Independent test server

### Production Environment

- **Containerization**: Docker + Kubernetes (Optional)
- **Cloud Providers**: AWS / Vercel / Railway
- **CI/CD**: GitHub Actions

### High Availability Design

- **Multi-region Deployment**: Master-slave database
- **Service Redundancy**: Multi-instance load balancing
- **Failover**: Automatic switch to backup services

## Scalability Design

### Horizontal Scaling

- **Stateless Services**: Easy horizontal scaling
- **Database Sharding**: Shard by user ID
- **CDN Distribution**: Global static resource distribution

### Vertical Scaling

- **GPU Servers**: AI services can upgrade GPU
- **Database Upgrade**: Scalable database configuration

## API Design Standards

### RESTful API

```
GET    /api/v1/products         # Get product list
GET    /api/v1/products/:id     # Get product details
POST   /api/v1/orders           # Create order
GET    /api/v1/orders/:id      # Get order status
POST   /api/v1/ai/generate      # AI generate image
POST   /api/v1/nft/mint         # Mint NFT
```

### GraphQL API (Optional)

For complex query scenarios, such as community content aggregation.

## Data Model

### Core Entities

- **User**: User information + wallet address
- **Product**: Product information + NFT metadata
- **Order**: Order information + blockchain transaction hash
- **NFT**: NFT contract address + Token ID
- **Community**: Community content + points records

Detailed data model design see database Schema documentation.

