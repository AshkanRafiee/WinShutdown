@echo off

:Choice
cls
:Loop
set /P q=Enter The Appropriate Hotkey(Shutdown="s",CancelShutdowns="c",Exit="e"):
if /I "%q%" EQU "s" goto :Shutcheck
if /I "%q%" EQU "c" goto :Cancelcheck
if /I "%q%" EQU "e" goto :Exit
goto :Choice

:Shutcheck
cls
set /P m=Enter Shutdown Time in Minutes:
SET /A t=%m% * 60
::set timee=%t%
::echo %timee%
:validation
set /P l=Are You Sure You Want To Shutdown Your System in %t% Seconds?(y/n) or (ChangeMinutes=cm): 
if /I "%l%" EQU "Y" goto :Shutdown
if /I "%l%" EQU "N" goto :Choice
if /I "%l%" EQU "CM" goto :Shutcheck
goto :validation

:Cancelcheck
set /P l=Are You Sure You Want To Cancel Your Shutdown Queues?(y/n): 
if /I "%l%" EQU "Y" goto :Cancel
if /I "%l%" EQU "N" goto :Choice
goto :Cancelcheck

:Shutdown
shutdown.exe /s /t %t%
echo your system will turn off in %t% seconds!
goto :Loop

:Cancel
shutdown.exe /a
echo your system will not turn off automatically!
goto :Loop

:Exit
exit
