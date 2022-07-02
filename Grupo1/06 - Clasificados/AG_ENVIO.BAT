@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (nov 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Batch externo ejecutado por el modulo de agencias en modo de transmisi¢n
REM


xcopy s:\sdclass\agencias\envio\*.* s:\sdclass\tango\*.* /a/m
