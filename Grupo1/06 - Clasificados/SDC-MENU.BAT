@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (oct 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Archivo batch para ejecutar los sub-modulos del sistema
REM

REM IF EXIST M:\SDCLASS\SDC-MENU.BAT GOTO CON_RED (linea comentada)
GOTO SIN_RED

:CON_RED
CALL SET_S
S:
GOTO INICIO

:SIN_RED
CALL SET_S
S:
GOTO INICIO


:INICIO
SDC-HOST
IF ERRORLEVEL 8 GOTO E8
IF ERRORLEVEL 7 GOTO E7
IF ERRORLEVEL 6 GOTO E6
IF ERRORLEVEL 5 GOTO E5
IF ERRORLEVEL 4 GOTO E4
IF ERRORLEVEL 3 GOTO E3
IF ERRORLEVEL 2 GOTO E2
IF ERRORLEVEL 1 GOTO E1
CLS
MODE MONO
ECHO 'PRESIONE CUALQUIER TECLA PARA CONTINUAR O CTRL-C PARA SALIR DEL MENU'
PAUSE
GOTO INICIO

:E1
SDC-INHO
GOTO INICIO

:E2
SDC-FOT
GOTO INICIO

:E3
SDC-CLI
GOTO INICIO

:E4
SDC-LIS /E
GOTO INICIO

:E5
SDC-AGE /E
copy s:\agencias\envio\*.* s:\tango
rem del s:\agencias\envio\*.* < yes.bat
GOTO INICIO

:E6
SDC-AGE /R
GOTO INICIO

:E7
:SDC-UPD /R /D
WIN PM4
:sdc-cred
GOTO INICIO

:E8
CALL XTG
GOTO INICIO

