@echo off
setlocal

rem Script lives in "Scripts/" folder, we need to stop by one level to the project root
pushd "%~dp0.."

rem Get the root folders name (usally project name)
for %%I in ("%~dp0..") do set "FolderName=%%~nxI"

rem Set premake5.exe path
set PREMAKE_EXE=Vendor\Premake\premake5.exe

rem Check that premake5 exists
if not exist "%PREMAKE_EXE%" (
    echo.
    echo Error: premake5.exe was not found
    echo Error: Expected to be at "%PREMAKE_EXE%"
    echo. 

    pause
    popd
    exit /b 1
)

echo.
echo Running Premake for "%FolderName%"
echo.

rem Generate solution and project files (default=vs2022)
"%PREMAKE_EXE%" vs2022

if %ERRORLEVEL% neq 0 (
    echo Error: Premake failed.
    echo.

	pause
	popd
	exit /b 1
)

echo.
pause

endlocal