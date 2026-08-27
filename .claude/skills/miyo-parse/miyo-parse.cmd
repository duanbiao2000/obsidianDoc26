@echo off
setlocal enableextensions
rem Parse one local PDF or EPUB through the Miyo CLI and print Markdown/text.
if "%~1"=="" (
  echo Usage: miyo-parse.cmd "file" 1>&2
  exit /b 1
)
set "MIYO=%LOCALAPPDATA%\Miyo\bin\miyo\miyo.exe"
if not exist "%MIYO%" (
  set "MIYO="
  where miyo >nul 2>&1 && set "MIYO=miyo"
)
if not defined MIYO (
  echo Miyo CLI not found. The Miyo desktop app is not installed - tell the user to install Miyo, then retry. Do not retry in a loop. 1>&2
  exit /b 3
)
"%MIYO%" parse "%~1"
