@echo off

rem get file name
for %%I in (.) do set FileName=%%~nxI

rem get extension
pushd ..
for %%I in (.) do set DirName=%%~nxI
if %DirName%==extensions (set FileExt=ext)
if %DirName%==modules (set FileExt=mod)
echo %FileExt%
popd

set FileName=%FileName%.%FileExt%

rem create source
echo building %FileName%
IF EXIST source.zip  (
    del "source.zip"
)
IF EXIST %FileName%  (
    del "%FileName%"
)
"%PROGRAMFILES%\7-Zip\7z.exe" a source.zip .\source\*
ren source.zip "%FileName%"

rem move build
set FinalDest=%APPDATA%\SmiteWorks\Fantasy Grounds\%DirName%\%FileName%
echo %FinalDest%
cp "%FileName%" "%FinalDest%"

rem clean up
IF EXIST source.zip  (
    del "source.zip"
)
IF EXIST %FileName%  (
    del "%FileName%"
)