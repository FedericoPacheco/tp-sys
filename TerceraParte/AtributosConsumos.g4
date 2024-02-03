/*
  TP SyS (tercera parte):
 	* Chort, Julio Alberto
 	* Pacheco Pilan, Federico Ignacio
 	* Reynoso, Valentin
  (ISI 'A' - 2020)
*/
 
grammar AtributosConsumos;
import LexerConsumos2;

consultas : consulta EOF | consulta consultas;                            
consulta  : 
    CONSULTA_ABRE encabezado consumos total_consumos CONSULTA_CIERRA
    {
        if ($consumos.total_calculado == $total_consumos.total_registrado) { 
            System.out.println("Verificación de total exitosa");
        }   
        else {   
            System.out.println("Verificación inválida");
        }
        
        System.out.println("Consumo máximo: " + Float.toString($consumos.consumo_maximo));
    };

//---------------------------------------------------------------------------------------
encabezado 	   : linea plan codigo_cliente nombre_cliente rango_fechas;
    linea          : LINEA_ABRE NUM_LINEA LINEA_CIERRA;
    plan           : PLAN_ABRE PLAN PLAN_CIERRA;
    codigo_cliente : CODCLI_ABRE CODIGO_CLI CODCLI_CIERRA;
    nombre_cliente : NOMCLI_ABRE NOMBRE_CLI NOMCLI_CIERRA;
    rango_fechas   : DESDE_ABRE FECHA DESDE_CIERRA HASTA_ABRE FECHA HASTA_CIERRA;
    
//---------------------------------------------------------------------------------------
consumos returns [float consumo_maximo, float total_calculado]: 
    CONS_ABRE registro_consumos CONS_CIERRA
    {
        $consumos.consumo_maximo = $registro_consumos.consumo_maximo;
        $consumos.total_calculado = $registro_consumos.total_calculado;
    };

registro_consumos returns [float consumo_maximo, float total_calculado]: 
    registro_consumo
    {
        $registro_consumos.consumo_maximo = $registro_consumo.consumo_maximo;
        $registro_consumos.total_calculado = $registro_consumo.total_calculado;
    }
    | 
    registro_consumo registro_consumos_H = registro_consumos
    {
        if ($registro_consumo.consumo_maximo > $registro_consumos_H.consumo_maximo) {
            $registro_consumos.consumo_maximo = $registro_consumo.consumo_maximo;
        }
        else {
              $registro_consumos.consumo_maximo = $registro_consumos_H.consumo_maximo;
        }

        $registro_consumos.total_calculado = $registro_consumo.total_calculado + $registro_consumos_H.total_calculado;
    };

registro_consumo returns [float consumo_maximo, float total_calculado]: 
    REGCON_ABRE numero_destino tarifa fecha hora duracion importe REGCON_CIERRA
    {
        $registro_consumo.consumo_maximo = $importe.valor;
        $registro_consumo.total_calculado = $importe.valor;
    };
    numero_destino : NUMDEST_ABRE NUM_LINEA NUMDEST_CIERRA;
    tarifa         : TARIFA_ABRE TARIFA TARIFA_CIERRA;
    fecha          : FECHA_ABRE FECHA FECHA_CIERRA;
    hora   	       : HORA_ABRE HORA HORA_CIERRA;
    duracion       : DURACION_ABRE DURACION DURACION_CIERRA;
    importe returns [float valor]: 
        IMPORTE_ABRE IMPORTE IMPORTE_CIERRA
        {
            String aux = $IMPORTE.text;
            aux = aux.replaceFirst(",", ".");
            $importe.valor = Float.parseFloat(aux);
        };
    
//--------------------------------------------------------------------------------------
total_consumos returns [float total_registrado]: 
    TOTAL_ABRE IMPORTE TOTAL_CIERRA
    {
        String aux = $IMPORTE.text;
        aux = aux.replaceFirst(",", ".");
        $total_consumos.total_registrado = Float.parseFloat(aux);
    };
