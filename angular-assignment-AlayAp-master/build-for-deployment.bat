@echo off
echo Building Angular app for static deployment...

REM Temporarily disable Yarn PnP to avoid build conflicts
if exist "C:\Users\alaya\.pnp.cjs" (
    echo Temporarily disabling Yarn PnP...
    ren "C:\Users\alaya\.pnp.cjs" ".pnp.cjs.backup"
)

REM Build the application
echo Building static version...
call npm run build:static

REM Restore Yarn PnP file
if exist "C:\Users\alaya\.pnp.cjs.backup" (
    echo Restoring Yarn PnP...
    ren "C:\Users\alaya\.pnp.cjs.backup" ".pnp.cjs"
)

echo.
echo ✅ Build completed successfully!
echo.
echo 📁 Deploy folder: dist\angular-feedback-app\browser
echo.
echo 🚀 Deployment instructions:
echo    - For Netlify: Drag and drop the 'browser' folder
echo    - For Vercel: Connect GitHub repo or use Vercel CLI
echo    - For GitHub Pages: Use 'gh-pages' npm package
echo.
echo 🌐 The _redirects file is included for proper SPA routing
echo.
pause
