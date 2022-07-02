*******************************************************************************************************
* Programa:    importavendedores.prg
* Descripción: Importa vendedores de Tango a Dbf de Sistema Publicidad
*******************************************************************************************************
* Autor:       Julián Marcelo Zappia
* Fecha:       27/08/2012
*******************************************************************************************************

SELECT 0
USE vendedores_tango ALIAS vendedores_tango

SELECT 0
USE vendedores ALIAS vendedores

SELECT vendedores_tango

GO top
DO WHILE NOT EOF()
   SELECT vendedores
   APPEND BLANK
   replace codigo   WITH vendedores_tango.cod_vended
   replace apellido WITH vendedores_tango.nom_vended
   replace comision WITH vendedores_tango.porc_comis
   
   SELECT vendedores_tango
   SKIP
ENDDO

SELECT vendedores_tango
USE

SELECT vendedores
USE

RETURN

   
   