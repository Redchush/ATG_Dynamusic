@echo off
setlocal

rem ------------------------------------------------------------
rem   Developing ATG Applications Part I (Dev1) Setup
rem 
rem 
rem Called explicitly, this batch file figures out where to copy 
rem its files based on the value of the DYNAMO_HOME environment 
rem variable.(for instance, to C:\ATG\ATG2007.1\home)
rem 
rem Calling syntax:
rem 
rem    setup_dev1
rem 
rem This setup script copies the Dynamusic-Base directory to
rem the <dynamo-dir> (determined from  DYNAMO_HOME). 
rem It creates a new database, starts it, and uses solsql to
rem created the required tables using dynamusic.sql.  Finally,
rem it populates these tables by invoking startSQLRepository 
rem with the all-examples-data.xml configuration file.
rem 
rem rem Usage:
rem   1) set DYNAMO_HOME=atginstallation\home
rem   2) make sure Solid is not running
rem   3) setup_dev1_db


Echo starting Dev1 setup.

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
  echo.
  goto :end
)
echo --- using ATGDIR= %ATGDIR%

call setup_dev1_files_new.bat
call setup_dev1_new_db.bat

Echo Dynamusic + Loyalty setup complete.


:end
