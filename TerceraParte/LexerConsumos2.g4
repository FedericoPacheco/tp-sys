/*
  TP SyS (segunda parte):
     * Chort, Julio Alberto
     * Pacheco Pilan, Federico Ignacio
     * Reynoso, Valentin
  (ISI 'A' - 2020)
*/
 
lexer grammar LexerConsumos2;

IGNORAR         : (' ' | '\t' | '\n' | '\r') -> skip;

// REGLAS BASE
// [1 - 32]:
CONSULTA_ABRE   : '<consulta_consumos>'  ;
CONSULTA_CIERRA : '</consulta_consumos>' ; 
LINEA_ABRE      : '<num_linea>'          ; 
LINEA_CIERRA    : '</num_linea>'         ;
PLAN_ABRE       : '<plan>'               ;
PLAN_CIERRA     : '</plan>'              ;
CODCLI_ABRE     : '<codigo_cliente>'     ;
CODCLI_CIERRA   : '</codigo_cliente>'    ;
NOMCLI_ABRE     : '<nombre_cliente>'     ;
NOMCLI_CIERRA   : '</nombre_cliente>'    ;
DESDE_ABRE      : '<desde>'              ;
DESDE_CIERRA    : '</desde>'             ;
HASTA_ABRE      : '<hasta>'              ;
HASTA_CIERRA    : '</hasta>'             ;
CONS_ABRE       : '<consumos>'           ;
CONS_CIERRA     : '</consumos>'          ;
REGCON_ABRE     : '<registro_consumo>'   ;
REGCON_CIERRA   : '</registro_consumo>'  ;
NUMDEST_ABRE    : '<numero_destino>'     ;
NUMDEST_CIERRA  : '</numero_destino>'    ;
TARIFA_ABRE     : '<tarifa>'             ;
TARIFA_CIERRA   : '</tarifa>'            ;
FECHA_ABRE      : '<fecha>'              ;
FECHA_CIERRA    : '</fecha>'             ;
HORA_ABRE       : '<hora>'               ;
HORA_CIERRA     : '</hora>'              ;
DURACION_ABRE   : '<duracion>'           ;
DURACION_CIERRA : '</duracion>'          ;
IMPORTE_ABRE    : '<importe>'            ;
IMPORTE_CIERRA  : '</importe>'           ;
TOTAL_ABRE      : '<total_consumos>'     ;
TOTAL_CIERRA    : '</total_consumos>'    ;

//[33 - 41]:
NUM_LINEA  : INT_3 '-' INT_3 '-' INT_3 '-' INT_3                                                               ; 
PLAN       : ('PLAN 3G' | 'PLAN 5G' | 'PLAN 8G' | 'PLAN EMPRESA')                                              ; 
CODIGO_CLI : INT_3 INT_3 '-' INT_2                                                                             ;
NOMBRE_CLI : STRING ', ' STRING                                                                                ;
TARIFA     : ('LLAMADA NACIONAL' | 'LLAMADA INTERNACIONAL' | 'MENSAJE DE TEXTO' | 'DESCARGA DE CONTENIDO')     ;
HORA       : ([0][0-9] | [1][0-9] | [2][0-3]) ':' [0-5][0-9] ':' [0-5][0-9]                                    ;
DURACION   : (INT_3 | INT_2 | INT)                                                                             ;
IMPORTE    : (INT | INT_2 | INT_3)('.' INT_3)* ',' INT_2                                                       ;
FECHA      : 
             (
                ( ([0][1-9] | [1][0-9] | [2][0-8]) '/' ([0][1-9] | [1][0-2])                               ) |
                ( ('29' | '30')                    '/' ([0]([1] | [3-9]) | [1][0-2])                       ) | 
                (  '31'                            '/' ([0]([1] | [3] | [5] | [7] | [8]) | [1]([0] | [2])) )
             )
                '/' ( (('19' | '20')[0-9][0-9]) | '2100' )                                                     ;       

// REGLAS AUXILIARES
fragment INT    : [0-9];
fragment INT_2  : INT INT;            
fragment INT_3  : INT INT INT;
fragment STRING : [A-Z]+ ([A-Z] | ' ')*;
