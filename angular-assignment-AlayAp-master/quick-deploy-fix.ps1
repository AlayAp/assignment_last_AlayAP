# Quick Angular Deployment Fix
Write-Host "🚀 Quick Angular Deployment Fix" -ForegroundColor Green

# Handle Yarn PnP conflict
$pnpPath = "C:\Users\alaya\.pnp.cjs"
$pnpBackupPath = "C:\Users\alaya\.pnp.cjs.backup"

if (Test-Path $pnpPath) {
    Rename-Item $pnpPath $pnpBackupPath
    Write-Host "✅ Yarn PnP temporarily disabled" -ForegroundColor Green
}

# Build the application
Write-Host "🔨 Building application..." -ForegroundColor Yellow
& npm run build:static

# Restore Yarn PnP
if (Test-Path $pnpBackupPath) {
    Rename-Item $pnpBackupPath $pnpPath
    Write-Host "✅ Yarn PnP restored" -ForegroundColor Green
}

$browserPath = "dist\angular-feedback-app\browser"

if (Test-Path $browserPath) {
    # Create 404.html for GitHub Pages
    Copy-Item "$browserPath\index.html" "$browserPath\404.html"
    Write-Host "✅ Created 404.html for GitHub Pages" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "🎉 BUILD SUCCESSFUL!" -ForegroundColor Green
    Write-Host "Deploy folder: $browserPath" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Quick deployment options:" -ForegroundColor Yellow
    Write-Host "1. Netlify: Drag '$browserPath' to netlify.com/drop" -ForegroundColor White
    Write-Host "2. Vercel: Run 'vercel --prod' in this directory" -ForegroundColor White
    Write-Host "3. GitHub Pages: Run 'npx angular-cli-ghpages --dir=$browserPath'" -ForegroundColor White
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
}
