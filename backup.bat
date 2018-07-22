@ECHO OFF
TITLE PCSimpleBackup

# Modify these variables to change backup destination:
set BACKUPDRIVELETTER=L:
set BACKUPFOLDERDIR=L:\DellPCBackup\
set BACKUPLOGFILE=L:\DellPCBackup.log

CLS

# DO NOT REMOVE LICENSING TEXT
ECHO ===========================================================================
ECHO Copyright 2018 Mikel Matticoli (https://matticoli.github.io)
ECHO.
ECHO   Licensed under the Apache License, Version 2.0 (the "License");
ECHO   you may not use this file except in compliance with the License.
ECHO   You may obtain a copy of the License at
ECHO.
ECHO       http://www.apache.org/licenses/LICENSE-2.0
ECHO.
ECHO   Unless required by applicable law or agreed to in writing, software
ECHO   distributed under the License is distributed on an "AS IS" BASIS,
ECHO   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
ECHO   See the License for the specific language governing permissions and
ECHO   limitations under the License.
ECHO ===========================================================================
ECHO.
ECHO.

C:
IF NOT EXIST %USERPROFILE%\ (
  GOTO END
) ELSE IF NOT EXIST %BACKUPDRIVELETTER%\ (
  GOTO NODRIVEDIR
)

L:
IF NOT EXIST %BACKUPFOLDERDIR% (
  ECHO Backup folder not found, creating...
  MKDIR L:\DellPCBackup
) ELSE (
  ECHO Backup folder found, will be updated
)

C:
ECHO Copying from %USERPROFILE%\ to %BACKUPFOLDERDIR%
ECHO THIS CAN NOT BE CANCELLED ONCE STARTED
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO CANCEL
ECHO Running backup, this may take a while...
robocopy %USERPROFILE% %BACKUPFOLDERDIR% /XO /XA:SH /S /XD AppData /XJD /R:5 /W:15  /MT:32 /NP /LOG:%BACKUPLOGFILE%
ECHO Backup complete!
GOTO END


:NODRIVEDIR
ECHO ERROR: Could not find backup drive, backup failed.
GOTO END


:NOWINDIR
ECHO ERROR: Could not find user folder, backup failed.
GOTO END


:CANCEL
ECHO Backup Cancelled
GOTO END

:END
ECHO Press any key to exit...
PAUSE > NUL