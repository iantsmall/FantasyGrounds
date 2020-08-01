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

set FileName="%FileName%.%FileExt%"
echo %FileName%

rem create source
del source.zip
"%PROGRAMFILES%\7-Zip\7z.exe" a source.zip .\source\*
del %FileName%
ren source.zip "%FileName%"

rem copy build
set FinalDest="%APPDATA%/SmiteWorks/Fantasy Grounds/%DirName%/"
echo %FinalDest%
cp %FileName% %FinalDest%
