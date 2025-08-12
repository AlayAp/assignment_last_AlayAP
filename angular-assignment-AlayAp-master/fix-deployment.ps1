# Angular Deployment Fix Script
# This script fixes common Angular deployment issues including 404 errors

Write-Host "🚀 Angular Deployment Fix Script" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

# Step 1: Clean previous builds
Write-Host "🧹 Cleaning previous builds..." -ForegroundColor Yellow
if (Test-Path "dist") {
    Remove-Item -Recurse -Force "dist"
    Write-Host "✅ Previous build cleaned" -ForegroundColor Green
}

# Step 2: Handle Yarn PnP conflict
Write-Host "🔧 Handling Yarn PnP conflict..." -ForegroundColor Yellow
$pnpPath = "C:\Users\alaya\.pnp.cjs"
$pnpBackupPath = "C:\Users\alaya\.pnp.cjs.backup"

if (Test-Path $pnpPath) {
    Rename-Item $pnpPath $pnpBackupPath
    Write-Host "✅ Yarn PnP temporarily disabled" -ForegroundColor Green
}

# Step 3: Build the application
Write-Host "🔨 Building Angular application..." -ForegroundColor Yellow
try {
    & npm run build:static
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Build successful!" -ForegroundColor Green
    } else {
        throw "Build failed"
    }
} catch {
    Write-Host "❌ Build failed. Trying alternative build..." -ForegroundColor Red
    # Try regular build if static fails
    & ng build --output-path=dist/angular-feedback-app/browser --configuration=production
}

# Step 4: Restore Yarn PnP
if (Test-Path $pnpBackupPath) {
    Rename-Item $pnpBackupPath $pnpPath
    Write-Host "✅ Yarn PnP restored" -ForegroundColor Green
}

# Step 5: Create additional routing files for different platforms
Write-Host "📁 Creating platform-specific routing files..." -ForegroundColor Yellow

$browserDir = "dist/angular-feedback-app/browser"
if (Test-Path $browserDir) {
    
    # Create 404.html for GitHub Pages
    $indexContent = Get-Content "$browserDir/index.html" -Raw
    Set-Content "$browserDir/404.html" $indexContent
    Write-Host "✅ Created 404.html for GitHub Pages" -ForegroundColor Green
    
    # Ensure _redirects file exists for Netlify
    if (-not (Test-Path "$browserDir/_redirects")) {
        Set-Content "$browserDir/_redirects" "/*    /index.html   200"
        Write-Host "✅ Created _redirects for Netlify" -ForegroundColor Green
    }
    
    # Create .htaccess for Apache servers
    $htaccessContent = @"
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteRule ^index\.html$ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.html [L]
</IfModule>
"@
    Set-Content "$browserDir/.htaccess" $htaccessContent
    Write-Host "✅ Created .htaccess for Apache servers" -ForegroundColor Green
    
    # Create web.config for IIS
    $webConfigContent = @"
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.webServer>
    <rewrite>
      <rules>
        <rule name="Angular Routes" stopProcessing="true">
          <match url=".*" />
          <conditions logicalGrouping="MatchAll">
            <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
            <add input="{REQUEST_FILENAME}" matchType="IsDirectory" negate="true" />
          </conditions>
          <action type="Rewrite" url="/index.html" />
        </rule>
      </rules>
    </rewrite>
  </system.webServer>
</configuration>
"@
    Set-Content "$browserDir/web.config" $webConfigContent
    Write-Host "✅ Created web.config for IIS servers" -ForegroundColor Green
    
} else {
    Write-Host "❌ Build directory not found!" -ForegroundColor Red
    exit 1
}

# Step 6: Display deployment information
Write-Host ""
Write-Host "🎉 DEPLOYMENT READY!" -ForegroundColor Green
Write-Host "===================" -ForegroundColor Green
Write-Host ""
Write-Host "📁 Deploy this folder: $browserDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "🌐 Platform-specific instructions:" -ForegroundColor Yellow
Write-Host ""
Write-Host "📌 NETLIFY:" -ForegroundColor Magenta
Write-Host "   1. Drag and drop the 'browser' folder to netlify.com/drop"
Write-Host "   2. Or use CLI: netlify deploy --prod --dir=dist/angular-feedback-app/browser"
Write-Host ""
Write-Host "📌 VERCEL:" -ForegroundColor Magenta
Write-Host "   1. Use CLI: vercel --prod"
Write-Host "   2. Or connect GitHub repo with build command: npm run build:static"
Write-Host "   3. Output directory: dist/angular-feedback-app/browser"
Write-Host ""
Write-Host "📌 GITHUB PAGES:" -ForegroundColor Magenta
Write-Host "   1. Install: npm install -g angular-cli-ghpages"
Write-Host "   2. Deploy: npx angular-cli-ghpages --dir=dist/angular-feedback-app/browser"
Write-Host ""
Write-Host "📌 FIREBASE:" -ForegroundColor Magenta
Write-Host "   1. Install: npm install -g firebase-tools"
Write-Host "   2. Login: firebase login"
Write-Host "   3. Init: firebase init hosting"
Write-Host "   4. Set public folder to: dist/angular-feedback-app/browser"
Write-Host "   5. Deploy: firebase deploy"
Write-Host ""

# Step 7: Test locally
Write-Host "🧪 Testing locally..." -ForegroundColor Yellow
Write-Host "Starting local server on http://localhost:8080"
Write-Host "Press Ctrl+C to stop the server"
Write-Host ""

# Start local server with proper SPA handling
if (Get-Command http-server -ErrorAction SilentlyContinue) {
    & http-server $browserDir -p 8080 --proxy "http://localhost:8080?" -o
} else {
    Write-Host "Installing http-server..." -ForegroundColor Yellow
    & npm install -g http-server
    & http-server $browserDir -p 8080 --proxy "http://localhost:8080?" -o
}
