@echo off
echo.
echo ============================================
echo Angular Deployment Fix Script
echo ============================================
echo.

echo Step 1: Handling Yarn PnP conflict...
if exist "C:\Users\alaya\.pnp.cjs" (
    ren "C:\Users\alaya\.pnp.cjs" ".pnp.cjs.backup"
    echo ✓ Yarn PnP temporarily disabled
)

echo.
echo Step 2: Building application...
call npm run build:static

echo.
echo Step 3: Restoring Yarn PnP...
if exist "C:\Users\alaya\.pnp.cjs.backup" (
    ren "C:\Users\alaya\.pnp.cjs.backup" ".pnp.cjs"
    echo ✓ Yarn PnP restored
)

echo.
echo Step 4: Creating additional routing files...
if exist "dist\angular-feedback-app\browser" (
    copy "dist\angular-feedback-app\browser\index.html" "dist\angular-feedback-app\browser\404.html" > nul
    echo ✓ Created 404.html for GitHub Pages
    
    echo.
    echo ============================================
    echo BUILD SUCCESSFUL!
    echo ============================================
    echo.
    echo Deploy folder: dist\angular-feedback-app\browser
    echo.
    echo Quick deployment options:
    echo 1. Netlify: Drag 'browser' folder to netlify.com/drop
    echo 2. Vercel: Run 'vercel --prod' in this directory  
    echo 3. GitHub Pages: Run 'npx angular-cli-ghpages --dir=dist/angular-feedback-app/browser'
    echo.
    echo Files ready for deployment:
    dir /b "dist\angular-feedback-app\browser"
) else (
    echo ERROR: Build failed!
    echo Please check the error messages above.
)

echo.
pause
