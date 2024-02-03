/*
  TP SyS (segunda parte):
     * Chort, Julio Alberto
     * Pacheco Pilan, Federico Ignacio
     * Reynoso, Valentin
  (ISI 'A' - 2020)
*/
 
grammar ParserConsumos;
import LexerConsumos2;

consultas                  : consulta EOF | consulta consultas                                           ;
consulta                   : CONSULTA_ABRE encabezado consumos total_consumos CONSULTA_CIERRA            ;

encabezado                 : linea plan codigo_cliente nombre_cliente rango_fechas                       ;
    linea                  : LINEA_ABRE NUM_LINEA LINEA_CIERRA                                           ;
    plan                   : PLAN_ABRE PLAN PLAN_CIERRA                                                  ;
    codigo_cliente         : CODCLI_ABRE CODIGO_CLI CODCLI_CIERRA                                        ;
    nombre_cliente         : NOMCLI_ABRE NOMBRE_CLI NOMCLI_CIERRA                                        ;
    rango_fechas           : DESDE_ABRE FECHA DESDE_CIERRA HASTA_ABRE FECHA HASTA_CIERRA                 ;

consumos                   : CONS_ABRE registro_consumos CONS_CIERRA                                     ; 
    registro_consumos      : registro_consumo | registro_consumo registro_consumos;
        registro_consumo   : REGCON_ABRE numero_destino tarifa fecha hora duracion importe REGCON_CIERRA ;
            numero_destino : NUMDEST_ABRE NUM_LINEA NUMDEST_CIERRA                                       ; 
            tarifa         : TARIFA_ABRE TARIFA TARIFA_CIERRA                                            ;
            fecha          : FECHA_ABRE FECHA FECHA_CIERRA                                               ;
            hora           : HORA_ABRE HORA HORA_CIERRA                                                  ;
            duracion       : DURACION_ABRE DURACION DURACION_CIERRA                                      ;
            importe        : IMPORTE_ABRE IMPORTE IMPORTE_CIERRA                                         ;

total_consumos             : TOTAL_ABRE IMPORTE TOTAL_CIERRA                                             ;

