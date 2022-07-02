@ECHO OFF

REM
REM	(C) SOFT DATA S.A. (nov 1992)
REM	SDCLASS (Sistema de Avisos Clasificados)
REM
REM	Batch externo ejecutado por el modulo de composici¢n
REM
s:
date > datetime < enter
time >> datetime < enter
copy estilos+datetime+01xclasi.fil w:\sdclass.xtg
del s:\01xclasi.fil
copy s:\estilos+datetime+*.fil w:\sdc-mart.xtg
del s:\*.fil
del s:\*.rub
del s:\datetime
