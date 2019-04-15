@echo off

:Choice
cls
set /P q=Enter The Appropriate Hotkey(Shutdown="s",CancelShutdowns="c",Exit="e"):
if /I "%q%" EQU "s" goto :Shut
if /I "%q%" EQU "s" goto :Cancel
if /I "%q%" EQU "e" goto :Exit
goto :Choice

:Shut
cls
set /P m=Enter Shutdown Time in Minutes:
SET /A t=%m% * 60
::set timee=%t%
::echo %timee%
:validation
set /P l=Are You Sure You Want To Shutdown Your System in %t% Seconds?(y/n) or (ChangeMinutes=cm): 
if /I "%l%" EQU "Y" echo shutdown -s -t %t%
if /I "%l%" EQU "N" goto :Choice
if /I "%l%" EQU "CM" goto :Shut
goto :validation

:Cancel
set /P l=Are You Sure You Want To Cancel Your Shutdown Queues?(y/n): 
if /I "%l%" EQU "Y" echo shutdown -a
if /I "%l%" EQU "N" goto :Choice
goto Cancel

:Exit
exit
