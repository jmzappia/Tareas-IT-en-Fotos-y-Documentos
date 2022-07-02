@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (Dic 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Batch externo ejecutado para realizar la carga de tablas y backups
REM

S:
SDC-LOAD

S:\XCOPY S:\BACKUP\BASES_B\1\*.* S:\BACKUP\BASES_B\2 /A /M
S:\XCOPY S:\BACKUP\BASES_C\1\*.* S:\BACKUP\BASES_C\2 /A /M

S:\XCOPY S:\BASES_B\*.* S:\BACKUP\BASES_B\1 /A /M
S:\XCOPY S:\BASES_C\*.* S:\BACKUP\BASES_C\1 /A /M

