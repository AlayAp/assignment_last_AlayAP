# Quick Command Reference 🚀

## ✅ Most Common Commands for Your Angular Project:

### 🏃 Development Commands:
```powershell
# Start development server
ng serve
# or
npm start

# Start on different port
ng serve --port 4202
```

### 🔨 Build Commands:
```powershell
# Build for deployment (RECOMMENDED)
.\deploy-fix.bat

# Manual build (static version)
npm run build:static

# Regular build
npm run build
```

### 🧪 Testing Commands:
```powershell
# Test the built app locally
npx http-server dist/angular-feedback-app/browser -p 8080 -o

# Run unit tests
npm test

# Check Angular version
ng version
```

### 🚀 Deployment Commands:

#### Netlify:
```powershell
# Install CLI
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=dist/angular-feedback-app/browser
```

#### Vercel:
```powershell
# Install CLI
npm install -g vercel

# Deploy
vercel --prod
```

#### GitHub Pages:
```powershell
# Install and deploy
npm install -g angular-cli-ghpages
npx angular-cli-ghpages --dir=dist/angular-feedback-app/browser
```

### 📁 File Commands:
```powershell
# List files in build directory
Get-ChildItem dist/angular-feedback-app/browser

# Check current directory
pwd

# List all files in current directory
ls
```

### ❌ Common Mistakes:
- ❌ `run` (not a valid command)
- ❌ `npm serve` (should be `npm start` or `ng serve`)
- ❌ `build` (should be `npm run build`)

### ✅ What You Probably Meant:
If you typed `run`, you probably wanted:
- `ng serve` - to start development server
- `npm start` - to start development server
- `npm run build:static` - to build for production
- `.\deploy-fix.bat` - to build and fix deployment issues
