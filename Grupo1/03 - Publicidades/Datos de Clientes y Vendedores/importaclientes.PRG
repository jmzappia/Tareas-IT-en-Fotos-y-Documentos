
*******************************************************************************************************
* Programa:    importaclientes.prg
* Descripción: Importa clientes de Tango a Dbf de Sistema Publicidad
*******************************************************************************************************
* Autor:       Julián Marcelo Zappia
* Fecha:       27/08/2012
*******************************************************************************************************

SELECT 0
USE clientes ALIAS clientes

SELECT 0
USE clientes_tango ALIAS clientes_tango

GO top
DO WHILE NOT EOF()
   SELECT clientes
   APPEND BLANK
   replace codigo    WITH clientes_tango.cod_client
   replace razon_soc WITH clientes_tango.razon_soci
   replace cuit      WITH clientes_tango.identiftri
   replace calle     WITH SUBSTR(clientes_tango.domicilio, 1, RAT(" ", ALLTRIM(clientes_tango.domicilio)))
   replace numero    WITH VAL(SUBSTR(clientes_tango.domicilio, RAT(" ", ALLTRIM(clientes_tango.domicilio)), 8))
   replace piso      WITH 0
   replace depto     WITH ""
   replace localidad WITH clientes_tango.localidad
   replace cod_post  WITH clientes_tango.c_postal
   replace telefono1 WITH SUBSTR(clientes_tango.telefono_1, 1, AT(" ", clientes_tango.telefono_1))
   replace telefono2 WITH SUBSTR(clientes_tango.telefono_2, 1, AT(" ", clientes_tango.telefono_2))
   replace contacto  WITH clientes_tango.nom_contac
   replace correo_e  WITH clientes_tango.e_mail
   replace f_alta    WITH CTOD(clientes_tango.fecha_alta)
   replace f_baja    WITH CTOD(clientes_tango.fecha_inha)
   replace observac  WITH clientes_tango.observacio
   SELECT clientes_tango
   SKIP
ENDDO

SELECT clientes
USE
SELECT clientes_tango
USE
RETURN

   
   