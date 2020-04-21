@ECHO OFF&PUSHD %~DP0 &TITLE Welcome to HeyTea Kit
mode con cols=128 lines=32
color 07
:menu
cls
echo Your DART_HOME: %DART_HOME%.
echo Your FLUTTER_HOME: %FLUTTER_HOME%.
echo.
echo Please select an action.
echo ==============================
echo 1) %DART_HOME%\pub run build_runner build
echo 2) %FLUTTER_HOME%\flutter packages pub run build_runner build --delete-conflicting-outputs
echo 3) %FLUTTER_HOME%\flutter packages pub run build_runner watch
echo ==============================
echo.
set /p user_input=Input action id:

if %user_input% equ 1 "%DART_HOME%/pub" run build_runner build
if %user_input% equ 2 "%FLUTTER_HOME%/flutter" packages pub run build_runner build --delete-conflicting-outputs
if %user_input% equ 3 "%FLUTTER_HOME%/flutter" packages pub run build_runner watch