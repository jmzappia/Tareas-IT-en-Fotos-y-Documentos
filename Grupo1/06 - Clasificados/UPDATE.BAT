@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (nov 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Batch externo ejecutado por el modulo de depuraci¢n
REM
del w:\*.xtg

rem S:\XCOPY S:\BACKUP\BASES_A\A_AYER\*.* S:\BACKUP\BASES_A\A_A_AYER /A

rem S:\XCOPY S:\BACKUP\BASES_A\AYER\*.* S:\BACKUP\BASES_A\A_AYER /A

rem S:\XCOPY S:\BACKUP\BASES_A\*.* S:\BACKUP\BASES_A\AYER /A

DEL S:\BACKUP\BASES_A\*.* < S:\YES.BAT
