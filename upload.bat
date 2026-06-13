@echo off
:: Set code page to UTF-8 to support Hebrew text in command line
chcp 65001 > nul
title העלאת קבצים ל-GitHub ועדכון האתר

echo ===================================================
echo   העלאת שינויים ועדכון אוטומטי של האתר ב-Vercel
echo ===================================================
echo.

cd /d "d:\antigravity"

echo [1/3] בודק שינויים מקומיים...
git status --short
echo.

echo [2/3] שומר את כל השינויים (Commit)...
git add -A
:: Get date and time for commit message
set timestamp=%date% %time%
git commit -m "Manual upload: %timestamp%"
echo.

echo [3/3] דוחף את השינויים ל-GitHub...
git push origin main
echo.

echo ===================================================
echo   הקבצים הועלו בהצלחה! האתר יתעדכן בדקה הקרובה.
echo ===================================================
echo.
pause
