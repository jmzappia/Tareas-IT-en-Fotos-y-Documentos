**************************************************************************************
* Programa:    PUBLIS.PRG
* Descripcion: Programa principal de aplicativo de gesti?n de publicidades
**************************************************************************************
* Autor:       Juli?n Marcelo Zappia
* Fecha: 
**************************************************************************************

ON SHUTDOWN cerrar ()

Application.Caption="DIARIO LA UNION - Gesti?n de Publicidades"

CLEAR 
_Screen.WindowState = 2
_Screen.MaxButton = .f.
_Screen.MinButton = .f.
_Screen.Caption = " DIARIO LA UNION - Gesti?n de Publicidades "
_Screen.BackColor = Rgb(1,1,1)
_Screen.AutoCenter = .f.

SET PROCEDURE TO libreria
SET DATE FRENCH
SET CENTURY ON
SET TALK OFF
SET CONFIRM OFF
SET EXACT OFF
SET NEAR ON
SET DECIMALS TO 2
SET DELETED ON 
SET SAFETY OFF
SET ESCAPE OFF

** Variables "CLIENTES"
PUBLIC cCodigo, cRazon, cCalle, nNumero, nPiso, cDepto, cLocalidad, cPostal, cTel1,;
       cTel2, cContacto, cCorreo, fAlta, fBaja

cCodigo    = SPACE(6)
cRazon     = SPACE(50)
cCuit      = SPACE(13)
cCalle     = SPACE(50)
nNumero    = 0
nPiso      = 0
cDepto     = SPACE(2)
cLocalidad = SPACE(50)
cPostal    = SPACE(10)
cTel1      = SPACE(15)
cTel2      = SPACE(15)
cContacto  = SPACE(50)
cCorreo    = SPACE(50)
fAlta      = DATE()
fBaja      = CTOD("  /  /  ")
cObservac  = ""

** Variables "VENDEDORES"
PUBLIC cCodVend, cApellidoVend, cNombreVend, nComisionVend, cTel1Vend, cTel2Vend, cCorreoVend,;
       cCalleVend, nNumeroVend, nPisoVend, cDeptoVend, cPostalVend, cLocalidadVend, fAltaVend,;
       fBajaVend, cObserVend

cCodVend       = SPACE(3)
cApellidoVend  = SPACE(50)
cNombreVend    = SPACE(50)
nComisionVend  = 0
cTel1Vend      = SPACE(15)
cTel2Vend      = SPACE(15)
cCorreoVend    = SPACE(50)
cCalleVend     = SPACE(50)
nNumeroVend    = 0
nPisoVend      = 0
cDeptoVend     = SPACE(2)
cPostalVend    = SPACE(10)
cLocalidadVend = SPACE(50)
fAltaVend      = DATE()
fBajaVend      = CTOD("  /  /  ")
cObserVend     = ""

** Variables ORDENES DE PUBLICIDAD
PUBLIC cFechasCalendario, cOrden, cCliente, cDescrip, nCol, NCm, cColor, cGrises, cUbicacion,;
       nImporte, cObserv, cVendedor, cBaja, fAlta, fBaja, fFechaIni, fFechaFin, lSelecRango,;
       lSelecCalendario, nColor, nGrises
PUBLIC cNuevoNumeroOrden, nParte2, cParte1, cParte2, dFechadeHoy, nDias, cVendedorSelec, nMarcaDias

cFechasCalendario = ""
cOrden            = SPACE(10)
cCliente          = SPACE(6)
cDescrip          = SPACE(50)
nCol              = 0
nCm               = 0
cColor            = " "
cGrises           = " "
cUbicacion        = SPACE(30)
nImporte          = 0
cObserv           = ""
cVendedor         = SPACE(3)
cBaja             = " "
fAlta             = DATE()
fBaja             = CTOD("  /  /  ")
fFechaIni         = DATE() 
fFechaFin         = DATE() + 30
lSelecRango       = .f.
lSelecCalendario  = .f.
cNuevoNumeroOrden = ""
nParte2           = 0
cParte1           = ""
cParte2           = ""
dFechadeHoy       = DATE()
nDias             = 0
nColor            = 0
nGrises           = 0
cVendedorSelec    = ""
nMarcaDias        = 0

** Otras variables de entorno       
PUBLIC OldSelect

OldSelect         = ""

SELECT 0
USE clientes
pack
USE

SELECT 0
USE vendedores
pack
USE

SELECT 0
USE publis
pack
USE

SELECT 0
USE cobranzas
pack
USE

SELECT 0
USE fechas
pack
USE


DO mpublis.mpr

READ EVENTS

PROCEDURE cerrar ()
IF MESSAGEBOX(" ?Desea salir del sistema? ",4+32,"Salir") = 6
	QUIT
ENDIF 
ENDPROC  
*CLEAR
