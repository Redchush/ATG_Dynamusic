@echo off
setlocal

rem ------------------------------------------------------------
rem   Developing ATG Applications Part I (Dev1) File Setup
rem 
rem TBD

echo *** starting dev1 file setup now ***
rem First, check if ATGDIR or DYNAMO_HOME is set. 

if not "%ATGDIR%" == "" (
 set DYNAMO_HOME=%ATGDIR%\home
) else if not "%DYNAMO_HOME%" == "" (
 set ATGDIR=%DYNAMO_HOME%\..
) 

if "%DYNAMO_HOME%" == "" (
  echo. 
  echo. You must set the DYNAMO_HOME variable to point to the
  echo. 'home' directory in your ATG installation 
  echo. ^(for instance, set ATGDIR=C:\ATG\ATG2007.1^)
  echo put directories of dynamusic-base, dynamusic and loyalty in this folder
  echo where installation files located
  echo.
  goto :end
)

if not exist Dynamusic-Base module (
echo put Dynamusic-Base in this directory
 goto :end
)

if not exist Dynamusic module (
echo put Dynamusic in this directory
 goto :end
)

if not exist Loyalty module (
echo put Loyalty in this directory
 goto :end
)


echo --- using ATGDIR= %ATGDIR%



rem If the Dynamusic-base directory already exists, save it.
if exist %ATGDIR%\Dynamusic-Base (
  echo Dynamusic-Base already exists, copying to Dynamusic-Base-savedev1
  xcopy %ATGDIR%\Dynamusic-Base %ATGDIR%\Dynamusic-Base-savedev1 /s /e /k /q /y /i
  rmdir %ATGDIR%\Dynamusic-Base /s /q
)

xcopy Dynamusic-Base %ATGDIR%\Dynamusic-Base /E /V /F /Q /-Y /i
echo Dynamusic-Base installed.

rem If the Dynamusic directory already exists, save it.
if exist %ATGDIR%\Dynamusic (
  echo Dynamusic already exists, copying to Dynamusic-savedev1
  xcopy %ATGDIR%\Dynamusic %ATGDIR%\Dynamusic-savedev1 /s /e /k /q /y /i
  rmdir %ATGDIR%\Dynamusic /s /q
)

xcopy Dynamusic %ATGDIR%\Dynamusic /E /V /F /Q /-Y /i
echo Dynamusic installed.

rem If the Loyalty directory already exists, save it.
if exist %ATGDIR%\Loyalty (
  echo Loyalty already exists, copying to Loyalty-savedev1
  xcopy %ATGDIR%\Loyalty %ATGDIR%\Loyalty-savedev1 /s /e /k /q /y /i
  rmdir %ATGDIR%\Loyalty /s /q
)

if "%JBOSS_ROOT%" == "" (
  echo JBOSS_ROOT is not set, so I'm not checking for QuincyFunds
) else (
  if exist %JBOSS_ROOT%\server\atg\deploy\QuincyFunds.ear (
     echo deleting %JBOSS_ROOT%\server\atg\deploy\QuincyFunds.ear
     rmdir %JBOSS_ROOT%\server\atg\deploy\QuincyFunds.ear /s/q
  )
)

echo *** dev1 file setup complete ***

:end
