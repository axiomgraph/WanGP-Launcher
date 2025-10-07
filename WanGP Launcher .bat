@echo off
title WanGP Launcher
color 0a

:: =====================================================
:: WanGP Launcher
:: Copyright (C) 2025 Axiom Graph
::
:: This program is licensed under the GNU General Public License v3.0.
:: =====================================================

:: ==============================
:: 💡 User-configurable paths
:: Change these according to your setup
:: ==============================
set "CONDA_PATH=%USERPROFILE%\miniconda3\Scripts\activate.bat"
set "WANGP_PATH=%USERPROFILE%\wan2gp"

:: =====================================================
:: Activate Conda environment ONCE at the start
:: This covers both update and launch options
:: =====================================================
echo Activating Conda environment...
call "%CONDA_PATH%" wan2gp

:: ==============================
:: Main Menu
:: ==============================
:menu
cls
echo ==============================
echo     WanGP LAUNCHER TOOL
echo ==============================
echo.
echo [1] Update WanGP (git pull + install requirements)
echo [2] Launch WanGP (skip update)
echo [3] Exit
echo.
set /p choice=Choose an option (1/2/3): 

if "%choice%"=="1" goto update
if "%choice%"=="2" goto launch
if "%choice%"=="3" exit

echo Invalid choice.
pause
goto menu

:: ==============================
:: Update Section
:: ==============================
:update
echo.
echo Navigating to WanGP directory...
cd /d "%WANGP_PATH%"

echo.
echo Pulling latest changes from GitHub...
git pull

echo.
echo Installing/Updating Python requirements...
pip install -r requirements.txt

echo.
echo Update complete.
pause
goto launch

:: ==============================
:: Launch Section
:: ==============================
:launch
echo.
echo Starting WanGP...
cd /d "%WANGP_PATH%"
python wgp.py --i2v --open-browser
pause
exit
