@echo off
set BASE_DIR=%~dp0
set PATH=%BASE_DIR%\bin;%BASE_DIR%\opt\7zip;%BASE_DIR%\git;%PATH%
if not exist "%BASE_DIR%\tmp" (
    mkdir %BASE_DIR%\tmp
)
if not exist "%BASE_DIR%\git\git-bash.exe" (
    curl -L -o %BASE_DIR%\tmp\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v2.22.0.windows.1/PortableGit-2.22.0-64-bit.7z.exe
    7za x -r -o%BASE_DIR%\git %BASE_DIR%\tmp\PortableGit.7z.exe
    %BASE_DIR%\git\git-bash.exe --no-needs-console --hide --no-cd --command=%BASE_DIR%\git\post-install.bat
)
cd /d %BASE_DIR%
start %BASE_DIR%\git\git-bash.exe -c ". bin/setenv %1;bash %2 %3 %4 %5 %6 %7 %8 %9"
