@echo off

rem  CK installation script for CNTK package
rem
rem Developer(s):
rem  * Grigori Fursin, dividiti/cTuning foundation
rem

set CNTK_LIB_DIR=%INSTALL_DIR%\lib

cd %INSTALL_DIR%

set URL2=https://cntk.ai/BinaryDrop/%CNTK_PACKAGE_BINARY_ARC%
wget --no-check-certificate %URL2%
if %errorlevel% neq 0 (
 echo.
 echo Error: Failed downloading CNTK binaries ...
 exit /b 1
)

echo.
echo Unzipping %CNTK_PACKAGE_BINARY_ARC% ...
echo.
unzip -o %CNTK_PACKAGE_BINARY_ARC%

del /Q %CNTK_PACKAGE_BINARY_ARC%

exit /b 0
