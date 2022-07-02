@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (nov 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Batch de instalaci¢n del SDCLASS
REM
REM

REM /*********************************************/
REM /* SETS PARA INDICAR PATHS DE BASES DE DATOS */
REM /*********************************************/

REM   Paths de Bases de Datos Modificables durante la operaci¢n
SET SDC_A=A:\
SET SDC_B=A:\

REM   Paths de Bases de Datos No Modificables durante la operaci¢n
SET SDC_C=A:\

SET SDC_T=A:\

REM /***************************************/
REM /* EJECUCION DEL MODULO DE INSTALACION */
REM /***************************************/

SDC-INST

