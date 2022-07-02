@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (Ene 1993)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Sets para indicar paths de bases de datos
REM

REM	Paths de Bases de Datos Modificables durante la operaci¢n
REM	Bases de Datos de Avisos Clasificados (de lectura-escritura)
SET SDC_A=E:\BASES_A\
REM	Bases de Datos de Configuraci¢n (de lectura-escritura)
SET SDC_B=E:\BASES_B\

REM	Paths de Bases de Datos No Modificables durante la operaci¢n
REM	Bases de Datos con solo datos de configuraci¢n (de lectura)
SET SDC_C=E:\BASES_C\

REM	Paths de Bases de Datos para uso Contable (de lectura-escritura)
SET SDC_X=E:\BASES_X\

REM	Paths de Bases de Datos para Backups Historicos On-line
REM	(de lectura-escritura)
SET SDC_Z=E:\BASES_Z\

REM	Paths de Bases de Datos para Backups Historicos de disco Off-line
REM	(de lectura)
SET SDC_ZZ=E:\BASES_ZZ\

REM	Path para la Generaci¢n de Archivos Temporarios
REM	(de lectura-escritura)
SET SDC_T=E:\


REM	Fin de Archivo
