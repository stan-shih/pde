@echo off
set BASE_DIR=%~dp0
set DEV_HOME=%BASE_DIR%
set PATH=%DEV_HOME%\bin;%DEV_HOME%\opt\7zip;%DEV_HOME%\PortableGit;%PATH%
if not exist "%DEV_HOME%\tmp" (
    mkdir %DEV_HOME%\tmp
)
set SUPPORT_VERSION=2.30.1.windows.1
:INSTALL
if not exist "%DEV_HOME%\PortableGit\git-bash.exe" (
    curl -L -o %DEV_HOME%\tmp\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v2.30.1.windows.1/PortableGit-2.30.1-64-bit.7z.exe
    7za x -r -o%DEV_HOME%\PortableGit %DEV_HOME%\tmp\PortableGit.7z.exe
    %BASE_DIR%\PortableGit\git-bash.exe --no-needs-console --hide --no-cd --command=%DEV_HOME%\git\post-install.bat
)
for /f "tokens=1-3" %%a in ( '"%DEV_HOME%\PortableGit\mingw64\bin\git.exe" --version' ) do set "GIT_VERSION=%%c"
if NOT "%GIT_VERSION%" == "%SUPPORT_VERSION%" (
    echo "The current version is %GIT_VERSION%, but Git has new version(%SUPPORT_VERSION%)."
    GOTO UPGRADE
)
cd /d %DEV_HOME%
start %DEV_HOME%\PortableGit\git-bash.exe -c "source developer %1;bash %2 %3 %4 %5 %6 %7 %8 %9"
exit 0

:UPGRADE
set /p ACTION=Upgrade version now(y/N)?
if "%ACTION%" == "Y"    set ACTION=y
if "%ACTION%" == "y" (
    echo Upgrade
    rd /s /q "%DEV_HOME%\PortableGit"
    GOTO INSTALL
)
pause
exit /b 1

