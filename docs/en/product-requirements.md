# FOFO Studio Product Requirements Document (PRD)

## 1. Product Overview

### 1.1 Product Positioning

FOFO Studio is a phygital platform integrating Web3, AIGC, and street culture. The core function is to allow users to generate unique NFT patterns through AI and print them on physical products.

### 1.2 Target Users

#### Primary User Groups

1. **Day Trader**
   - Age: 25-35
   - Characteristics: Pursuing personalization, understanding Crypto culture, purchasing power
   - Needs: Unique self-expression, trading culture identity

2. **Crypto Native Users**
   - Age: 20-40
   - Characteristics: Deeply involved in Web3, holding NFTs, familiar with blockchain
   - Needs: Phygital product experience, DAO participation

3. **Street Culture Enthusiasts**
   - Age: 18-30
   - Characteristics: Love Meme, Cyberpunk, Retro styles
   - Needs: Limited edition products, community belonging

4. **AI Creators**
   - Age: 20-35
   - Characteristics: Using AI tools for creation, hoping to monetize creativity
   - Needs: Creation platform, royalty income

### 1.3 Core Value Propositions

- **Prompt to Product**: Generate unique products with one sentence
- **Digital Ownership**: NFT verification, truly own your design
- **Community Co-creation**: Share creativity, earn royalty income
- **Phygital Fusion**: Digital creation immediately materialized

## 2. Functional Requirements

### 2.1 The Neural Mint

#### Function Description

Users input Prompts, AI generates images, automatically mints as NFT, and prints on physical products.

#### User Flow

1. **Entry**: Click "Create" or "The Neural Mint"
2. **Input Prompt**: 
   - Text input box (terminal style)
   - Style chips quick buttons
   - Prompt example library
3. **Generate Preview**: 
   - Display 4 variants
   - Loading animation (code decryption effect)
4. **Select & Edit**:
   - Select favorite one
   - Optional: Adjust parameters and regenerate
5. **Select Carrier**:
   - T-shirt, hoodie, phone case, mousepad, etc.
   - Real-time 3D preview
   - AR try-on (mobile)
6. **Mint NFT**:
   - Connect wallet
   - Confirm Gas fees
   - Minting complete
7. **Place Order**:
   - Select size, color
   - Fill address
   - Payment (Crypto or fiat)
8. **Tracking**:
   - Order status
   - Production progress
   - Logistics information

#### Technical Requirements

- **Response Time**: Image generation < 30 seconds
- **Concurrent Processing**: Support 100+ concurrent requests
- **NFT Minting**: < 5 seconds (Polygon network)
- **Preview Loading**: < 2 seconds

#### Business Rules

- Free users: 3 free generations per day
- Paid users: Unlimited generation + higher quality
- NFT minting: Requires Gas fee payment (approx. $0.01-0.1)

### 2.2 The Market

#### Function Description

Display all products with unique categorization and trading-style UI.

#### Core Functions

1. **Product Display**:
   - Category browsing (Green Candles, Internet Heritage, Neural Link)
   - Search function
   - Filters (price, style, carrier)

2. **Product Detail Page**:
   - Image display (360-degree rotation support)
   - Data panel (Bloomberg Terminal style)
   - Design inspiration description
   - Purchase button ("LONG" button)
   - Related recommendations ("Hedging Options")

3. **Shopping Flow**:
   - Shopping cart ("Portfolio")
   - Checkout page
   - Payment method selection (Crypto / Credit Card)
   - Order confirmation

#### UI Features

- **Ticker Tape**: Top scrolling display of Crypto prices, hot products
- **Dynamic Pricing**: Some product prices linked to BTC price
- **FOMO Countdown**: Limited edition product countdown purchase

### 2.3 Alpha DAO

#### Function Description

Community content sharing platform where users share trading insights, Memes, and trend information.

#### Core Functions

1. **Content Publishing**:
   - Text posts
   - Image sharing
   - Trading screenshots
   - Meme images

2. **Interaction Features**:
   - Like, comment, share
   - Favorite (add to personal Alpha library)
   - Report inappropriate content

3. **Points System**:
   - Karma Points
   - Earn points for publishing content
   - Extra rewards for high-quality content
   - Exchange points for products/discounts

4. **Content Recommendations**:
   - Trending content
   - Following list
   - Personalized recommendations

#### Business Rules

- Daily post limit: Prevent spam
- Content moderation: AI + manual review
- Points validity: 6 months

### 2.4 Co-Create Lab

#### Function Description

Open design resources, allowing users to remix, selected designs can be mass-produced with royalties.

#### Core Functions

1. **Resource Download**:
   - Logo source files
   - Design templates
   - Pattern materials

2. **Upload Works**:
   - Upload design images
   - Fill design description
   - Select authorization method

3. **Community Voting**:
   - Users vote for excellent designs
   - Designers receive royalty share (10-30%)

4. **Royalty Tracking**:
   - Display design usage count
   - Royalty income statistics
   - Automatic revenue distribution

### 2.5 The Vault

#### Function Description

VIP membership area providing exclusive products and premium customization services.

#### Access Requirements

- Hold FOFO NFT
- Spending over $1000
- Hold governance tokens (future)

#### Privilege Features

- Exclusive product purchase rights
- Premium customization services
- Priority purchase of limited editions
- Exclusive customer service channel

### 2.6 Custom Loadout

#### Function Description

Premium customization service allowing users to print personal content.

#### Customizable Content

- Trading screenshot
- Wallet address QR code
- Personal Meme avatar
- AI-generated personal portrait
- Custom text

#### Process

1. Upload/select content
2. AI processing optimization
3. Preview effect
4. Confirm order
5. Production and shipping

## 3. Non-Functional Requirements

### 3.1 Performance Requirements

- **Page Load**: < 2 seconds
- **API Response**: < 500ms (P95)
- **Image Generation**: < 30 seconds
- **Payment Processing**: < 10 seconds

### 3.2 Availability Requirements

- **System Availability**: 99.9% (annual downtime < 8.76 hours)
- **Data Backup**: Daily automatic backup
- **Failure Recovery**: < 1 hour

### 3.3 Security Requirements

- **Data Encryption**: HTTPS + database encryption
- **User Authentication**: Web3 wallet + traditional authentication
- **Payment Security**: PCI-DSS compliance
- **Smart Contract Audit**: Third-party security audit

### 3.4 Compatibility Requirements

- **Browsers**: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Mobile**: iOS 14+, Android 10+
- **Wallets**: MetaMask, WalletConnect compatible wallets

### 3.5 Scalability Requirements

- **User Scale**: Support 100K+ registered users
- **Concurrent Users**: Support 1000+ concurrent online
- **Storage**: Support PB-level image storage

## 4. UI/UX Design Requirements

### 4.1 Visual Style

- **Theme**: Cyberpunk + Retro + Glitch
- **Colors**: Dark background + neon colors (cyan, purple, pink)
- **Fonts**: Bold sans-serif + terminal code font
- **Animations**: Glitch effects + pixelated animations

### 4.2 Interaction Design

- **Mouse Hover**: K-line chart animation, pixelated icons
- **Loading Animation**: Code decryption, matrix digital rain
- **Page Transition**: Glitch transition effects

### 4.3 Responsive Design

- **Desktop**: 1920x1080 primary
- **Tablet**: 768x1024
- **Mobile**: 375x667 and up

## 5. Data Analysis Requirements

### 5.1 Key Metrics (KPI)

- **User Metrics**: DAU, MAU, retention rate
- **Transaction Metrics**: GMV, order count, average order value
- **AI Generation**: Generation count, conversion rate
- **Community Metrics**: Content posts, interaction rate

### 5.2 User Behavior Analysis

- User path tracking
- Feature usage heatmap
- Conversion funnel analysis
- A/B testing framework

## 6. Operational Requirements

### 6.1 Content Operations

- Regular Meme analysis posts
- Trader Diaries series content
- Community event planning

### 6.2 Marketing & Promotion

- Social media marketing (Twitter, Discord)
- KOL collaboration
- Limited edition Drop events
- Prompt Battle competitions

### 6.3 Customer Service

- Online customer service system
- FAQ
- User feedback collection

## 7. Technical Constraints

### 7.1 Third-party Dependencies

- AI model API (stable availability)
- Blockchain network (Gas fee volatility)
- Print on Demand suppliers (delivery time)

### 7.2 Legal Compliance

- NFT legal status
- Cryptocurrency payment compliance
- Intellectual property protection
- Data privacy protection (GDPR, CCPA)

## 8. Release Plan

### Phase 1: MVP

- The Neural Mint basic functionality
- The Market e-commerce functionality
- Web3 payment integration

### Phase 2: Community

- Alpha DAO launch
- Co-Create Lab opening
- Royalty system

### Phase 3: Enhancement

- AR virtual try-on
- The Vault membership system
- More product carriers

## 9. Success Criteria

### Short-term Goals (3 months)

- 1000+ registered users
- 100+ NFT mints
- 50+ completed orders

### Mid-term Goals (6 months)

- 10,000+ registered users
- 1000+ NFT mints
- 500+ completed orders
- 1000+ community content posts

### Long-term Goals (12 months)

- 100,000+ registered users
- 10,000+ NFT mints
- 5,000+ completed orders
- DAO governance launch

