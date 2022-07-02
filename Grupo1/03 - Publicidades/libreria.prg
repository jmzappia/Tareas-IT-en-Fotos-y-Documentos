***************************************************************************************
* Programa:    LIBRERIA.PRG
* Descripci�n: Librer�a de procedimientos y funciones
***************************************************************************************
* Autor: Juli�n Marcelo Zappia
* Fecha: 
***************************************************************************************

FUNCTION ValorTabla
PARAMETERS cCodigoTabla, cAccion, cValor
***************************************************************************************
* Funci�n:     ValorTabla()
* Descripci�n: Retorna / Actualiza valor de tabla
***************************************************************************************
* Par�metros:  cCodigoTabla (C�digo a buscar), cAccion (R = Retorno / A = Actualiza),
*              cValor (Valor a modificar en tabla)
***************************************************************************************
PRIVATE OldSelect, Retorno
OldSelect = SELECT()

IF NOT USED("tabla")
   SELECT 0
   USE tabla ALIAS tabla
   INDEX on codigo TO tabla
   SET INDEX TO tabla
ENDIF

SELECT tabla
SEEK cCodigoTabla
IF FOUND()
   IF cAccion = "R"
      Retorno = ALLTRIM(valor)
      SELECT(OldSelect)
      RETURN Retorno
   ELSE
      replace valor WITH cValor
      SELECT(OldSelect)
      RETURN ""
   ENDIF
ELSE
   SELECT(OldSelect)
   RETURN ""
ENDIF



FUNCTION CompletaConCeros
PARAMETERS cValor, nLargo
***************************************************************************************
* Funci�n:     CompletaConCeros() // Completa con ceros un valor determinado 
* Descripci�n: (Ej= "10" a "00000010") // Retorna / Actualiza valor de tabla
***************************************************************************************
* Par�metros:  cValor(Valor en string), nLargo (Longitud de la cadena a retornar)
*              
***************************************************************************************
PRIVATE ValorRetorno
ValorRetorno = REPLICATE("0",((nLargo - LEN(cValor)))) + ALLTRIM(cValor) 
RETURN ValorRetorno



FUNCTION BuscarCliente
PARAMETERS cCodigo
***************************************************************************************
* Funci�n:     BuscarCliente()
* Descripci�n: Retorna la raz�n social del cliente a partir del c�digo
***************************************************************************************
* Par�metros:  cCodigo (C�digo de Cliente)
*              
***************************************************************************************
PRIVATE Retorna
Retorna   = ""
OldSelect = SELECT()

SELECT clientes

SEEK ALLTRIM(cCodigo)
IF FOUND()
   IF ALLTRIM(clientes.codigo) = ALLTRIM(cCodigo)
      Retorna = ALLTRIM(clientes.razon_soc)
   ELSE
      Retorna = ""
   ENDIF
   SELECT(OldSelect)
   RETURN cCodigo + " - " + Retorna
ELSE
   SELECT(OldSelect)
   RETURN Retorna
ENDIF



FUNCTION BuscarVendedor
PARAMETERS cCodigo
***************************************************************************************
* Funci�n:     BuscarVendedor()
* Descripci�n: Retorna el apellido y nombre del vendedor a partir del c�digo
***************************************************************************************
* Par�metros:  cCodigo (C�digo de Vendedor)
*              
***************************************************************************************
PRIVATE Retorna
Retorna   = ""
OldSelect = SELECT()

SELECT vendedores

SEEK ALLTRIM(cCodigo)
IF FOUND()
   IF ALLTRIM(vendedores.codigo) = ALLTRIM(cCodigo)
       Retorna = cCodigo + " - " + ALLTRIM(vendedores.apellido) + ", " + ALLTRIM(vendedores.nombre)
   ELSE
       Retorna = ""
   ENDIF
   SELECT(OldSelect)
   RETURN Retorna
ELSE
   SELECT(OldSelect)
   RETURN Retorna
ENDIF



FUNCTION CalculaSaldo
PARAMETERS cOrden, nImporte
***************************************************************************************
* Funci�n:     CalculaSaldo()
* Descripci�n: Calcula el saldo de una OP a partir del n�mero de orden e importe
***************************************************************************************
* Par�metros:  cOrden (N� de OP), nImporte (Importe total de la OP)
*              
***************************************************************************************
PRIVATE Retorna
Retorna   = nImporte
OldSelect = SELECT()

IF NOT USED("cobranzas")
   SELECT 0
   USE cobranzas INDEX cobra_1
   REINDEX
ENDIF
SELECT cobranzas

SET FILTER TO ALLTRIM(cobranzas.orden) = ALLTRIM(cOrden) AND cobranzas.estado <> "B"
GO top

Retorna = 0
DO WHILE NOT EOF()
   Retorna = Retorna + cobranzas.importe
   SKIP
ENDDO
SET FILTER TO 
SELECT(OldSelect)
RETURN (nImporte - Retorna)



FUNCTION CalculaEstado
PARAMETERS cOrden
***************************************************************************************
* Funci�n:     CalculaEstado()
* Descripci�n: Retorna el estado de la publicaci�n de acuerdo a los d�as de public.
***************************************************************************************
* Par�metros:  cOrden (N� de OP)
*              
***************************************************************************************
PRIVATE Retorna, ControlFecha
Retorna      = " "
ControlFecha = CTOD("  /  /  ")
OldSelect    = SELECT()

IF NOT USED("fechas")
   SELECT 0
   USE fechas INDEX fechas_1
   REINDEX
ENDIF
SELECT fechas

SET FILTER TO ALLTRIM(fechas.orden) = ALLTRIM(cOrden) AND fechas.fecha_pub >= DATE() AND fechas.estado <> "B"
GO top

DO WHILE NOT EOF()
      Retorna = "P"
      SKIP
ENDDO
SET FILTER TO 

Retorna = iif(Retorna = "P", "Publicando a la fecha.", "No publica.")
SELECT(OldSelect)
RETURN Retorna



FUNCTION UltimaFechaPub
PARAMETERS cOrden
***************************************************************************************
* Funci�n:     UltimaFechaPub()
* Descripci�n: Retorna la �ltima fecha de publicaci�n registrada de una orden de pub.
***************************************************************************************
* Par�metros:  cOrden (N� de OP)
*              
***************************************************************************************
PRIVATE Retorna, ControlFecha
Retorna      = " "
ControlFecha = CTOD("  /  /  ")
OldSelect    = SELECT()

IF NOT USED("fechas")
   SELECT 0
   USE fechas INDEX fechas_1
   REINDEX
ENDIF
SELECT fechas

SET FILTER TO ALLTRIM(fechas.orden) = ALLTRIM(cOrden) AND fechas.fecha_pub >= DATE() AND fechas.estado <> "B"
GO top

DO WHILE NOT EOF()
      ControlFecha = fechas.fecha_pub
      SKIP
ENDDO
SET FILTER TO 

SELECT(OldSelect)
RETURN ControlFecha
 