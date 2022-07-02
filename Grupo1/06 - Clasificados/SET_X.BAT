@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (Ene 1993)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Sets para indicar paths de bases de datos
REM

REM	Path de Bases de Datos Modificables durante la operaci¢n
REM	Bases de Datos de Avisos Clasificados (de lectura-escritura)
SET SDC_A=H:\SDCLASS\BASES_A\
REM	Bases de Datos de Configuraci¢n (de lectura-escritura)
SET SDC_B=H:\SDCLASS\BASES_B\

REM	Path de Bases de Datos No Modificables durante la operaci¢n
REM	Bases de Datos con solo datos de configuraci¢n (de lectura)
SET SDC_C=C:\SDCLASS\BASES_C\

REM	Path de Bases de Datos para uso Contable (de lectura-escritura)
SET SDC_X=C:\SDCLASS\BASES_X\

REM	Path de Bases de Datos para Backups Historicos On-line
REM	(de lectura-escritura)
SET SDC_Z=C:\SDCLASS\BASES_Z\

REM	Path de Bases de Datos para Backups Historicos Off-line
REM	(de lectura-escritura)
SET SDC_ZZ=C:\SDCLASS\BASES_ZZ\

REM	Path para la Generaci¢n de Archivos Temporarios
REM	(de lectura-escritura)
SET SDC_T=C:\SDCLASS\

REM	Fin de Archivo
