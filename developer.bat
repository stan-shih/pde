@echo off
set BASE_DIR=%~dp0
set DEV_HOME=%BASE_DIR%
set PATH=%DEV_HOME%\bin;%DEV_HOME%\opt\7zip;%DEV_HOME%\PortableGit;%PATH%
if not exist "%DEV_HOME%\tmp" (
    mkdir %DEV_HOME%\tmp
)
if not exist "%DEV_HOME%\PortableGit\git-bash.exe" (
    curl -L -o %DEV_HOME%\tmp\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v2.22.0.windows.1/PortableGit-2.22.0-64-bit.7z.exe
    7za x -r -o%DEV_HOME%\PortableGit %DEV_HOME%\tmp\PortableGit.7z.exe
    %BASE_DIR%\PortableGit\git-bash.exe --no-needs-console --hide --no-cd --command=%DEV_HOME%\git\post-install.bat
)
cd /d %DEV_HOME%
start %DEV_HOME%\PortableGit\git-bash.exe -c "source developer %1;bash %2 %3 %4 %5 %6 %7 %8 %9"
