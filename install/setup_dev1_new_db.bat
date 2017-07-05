@echo off
setlocal
 
rem ------------------------------------------------------------
rem   Developing ATG Applications Part I (Dev1) Setup
rem   for database and repository
rem
rem   this script is intended to be run by setup_dev1.bat, it
rem   assumes the necessary modules have been copied in
rem
rem Usage:
rem   1) set DYNAMO_HOME=atginstallation\home
rem   2) make sure Solid is not running
rem   3) setup_dev1_db
rem -------------------------------------------------------------

Echo *** starting Dev1 database (dev1db_clean) setup now ***

rem First check if ATGDIR or DYNAMO_HOME is set 

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
  echo.
  goto :end
)

set SOLIDDIR=%ATGDIR%\DAS\solid


REM Creating Dev1 solid database (listening on port 1313)

echo Copying DAS\solid\atgdb to DAS\solid\dev1db_clean directory
if exist %SOLIDDIR%\dev1db_clean (
  echo. dev1db_clean already exists, copying to -save
  xcopy %SOLIDDIR%\dev1db_clean %SOLIDDIR%\dev1db_clean-save /s /e /k /q /y /i
  rmdir %SOLIDDIR%\dev1db_clean /s /q
)
mkdir %SOLIDDIR%\dev1db_clean
REM xcopy %SOLIDDIR%\_atg_db %SOLIDDIR%\dev1db_clean /E /V /F /Q /-Y

echo Starting Dev 1 Solid database now.  Please press any key when Solid startup completes...
start %SOLIDDIR%\i486-unknown-win32\solfe.exe -c %SOLIDDIR%\dev1db_clean
pause

echo create DAS 
%SOLIDDIR%\i486-unknown-win32\solsql -f %ATGDIR%\DAS\sql\install\solid\das_ddl.sql "tcp localhost 1313" admin admin

echo create DPS 
%SOLIDDIR%\i486-unknown-win32\solsql -f %ATGDIR%\DPS\sql\install\solid\dps_ddl.sql "tcp localhost 1313" admin admin

echo create DSS 
%SOLIDDIR%\i486-unknown-win32\solsql -f %ATGDIR%\DSS\sql\install\solid\dss_ddl.sql "tcp localhost 1313" admin admin

echo Installing Dynamusic database tables...
%SOLIDDIR%\i486-unknown-win32\solsql -f %ATGDIR%\Dynamusic-Base\sql\dynamusic.sql "tcp localhost 1313" admin admin

REM Loyalty
echo create Loyalty module tables
%SOLIDDIR%\i486-unknown-win32\solsql -f %ATGDIR%\Loyalty\sql\loyalty.sql "tcp localhost 1313" admin admin
echo create repository: Loyalty
%DYNAMO_HOME%\bin\startSQLRepository –m Loyalty –repository /dynamusic/lp/repository/LoyaltyRepository

REM Dynamusic-Base
echo Importing Dynamusic data:SongsRepository...
%DYNAMO_HOME%\bin\startSQLRepository -m Dynamusic-Base -import %ATGDIR%\Dynamusic-Base\config\dynamusic\songs-data.xml -repository /dynamusic/SongsRepository
echo Importing Dynamusic data: EventsRepository

REM Dynamusic
%DYNAMO_HOME%\bin\startSQLRepository –m Dynamusic –repository /dynamusic/EventsRepository
%DYNAMO_HOME%\bin\startSQLRepository -m Dynamusic -import ../Dynamusic/config/dynamusic/events-data.xml -repository /dynamusic/EventsRepository
%DYNAMO_HOME%\bin\startSQLRepository –m Dynamusic –repository /atg/userprofiling/ProfileAdapterRepository


Echo *** dev1db_clean database setup complete ***
Echo *** database can be started with this command:
Echo *** %SOLIDDIR%\i486-unknown-win32\solfe.exe -c %SOLIDDIR%\dev1db_clean

:end
