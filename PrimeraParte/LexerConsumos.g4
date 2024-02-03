/*
  TP SyS (primera parte):
     * Chort, Julio Alberto
     * Pacheco Pilan, Federico Ignacio
     * Reynoso, Valentin
  (ISI 'A' - 2020)
*/
 
lexer grammar LexerConsumos;

IGNORAR         : (' ' | '\t' | '\n' | '\r') -> skip;

// REGLAS BASE
// [1 - 32]:
CONSULTA_ABRE   : '<consulta_consumos>'  { System.out.println("CONSULTA_ABRE");    };
CONSULTA_CIERRA : '</consulta_consumos>' { System.out.println("CONSULTA_CIERRA");  }; 
LINEA_ABRE      : '<num_linea>'          { System.out.print  ("LINEA_ABRE");       }; 
LINEA_CIERRA    : '</num_linea>'         { System.out.println(" LINEA_CIERRA");    };
PLAN_ABRE       : '<plan>'               { System.out.print  ("PLAN_ABRE");        };
PLAN_CIERRA     : '</plan>'              { System.out.println(" PLAN_CIERRA");     };
CODCLI_ABRE     : '<codigo_cliente>'     { System.out.print  ("CODCLI_ABRE");      };
CODCLI_CIERRA   : '</codigo_cliente>'    { System.out.println(" CODCLI_CIERRA");   };
NOMCLI_ABRE     : '<nombre_cliente>'     { System.out.print  ("NOMCLI_ABRE");      };
NOMCLI_CIERRA   : '</nombre_cliente>'    { System.out.println(" NOMCLI_CIERRA");   };
DESDE_ABRE      : '<desde>'              { System.out.print  ("DESDE_ABRE");       };
DESDE_CIERRA    : '</desde>'             { System.out.println(" DESDE_CIERRA");    };
HASTA_ABRE      : '<hasta>'              { System.out.print  ("HASTA_ABRE");       };
HASTA_CIERRA    : '</hasta>'             { System.out.println(" HASTA_CIERRA");    };
CONS_ABRE       : '<consumos>'           { System.out.println("CONS_ABRE");        };
CONS_CIERRA     : '</consumos>'          { System.out.println("CONS_CIERRA");      };
REGCON_ABRE     : '<registro_consumo>'   { System.out.println("REGCON_ABRE");      };
REGCON_CIERRA   : '</registro_consumo>'  { System.out.println("REGCON_CIERRA");    };
NUMDEST_ABRE    : '<numero_destino>'     { System.out.print  ("NUMDEST_ABRE");     };
NUMDEST_CIERRA  : '</numero_destino>'    { System.out.println(" NUMDEST_CIERRA");  };
TARIFA_ABRE     : '<tarifa>'             { System.out.print  ("TARIFA_ABRE");      };
TARIFA_CIERRA   : '</tarifa>'            { System.out.println(" TARIFA_CIERRA");   };
FECHA_ABRE      : '<fecha>'              { System.out.print  ("FECHA_ABRE");       };
FECHA_CIERRA    : '</fecha>'             { System.out.println(" FECHA_CIERRA");    };
HORA_ABRE       : '<hora>'               { System.out.print  ("HORA_ABRE");        };
HORA_CIERRA     : '</hora>'              { System.out.println(" HORA_CIERRA");     };
DURACION_ABRE   : '<duracion>'           { System.out.print  ("DURACION_ABRE");    };
DURACION_CIERRA : '</duracion>'          { System.out.println(" DURACION_CIERRA"); };
IMPORTE_ABRE    : '<importe>'            { System.out.print  ("IMPORTE_ABRE");     };
IMPORTE_CIERRA  : '</importe>'           { System.out.println(" IMPORTE_CIERRA");  };
TOTAL_ABRE      : '<total_consumos>'     { System.out.print  ("TOTAL_ABRE");       };
TOTAL_CIERRA    : '</total_consumos>'    { System.out.println(" TOTAL_CIERRA");    };

//[33 - 41]:
NUM_LINEA  : INT_3 '-' INT_3 '-' INT_3 '-' INT_3                                                               { System.out.print(" NUM_LINEA: "  + getText()); }; 
PLAN       : ('PLAN 3G' | 'PLAN 5G' | 'PLAN 8G' | 'PLAN EMPRESA')                                              { System.out.print(" PLAN: "       + getText()); }; 
CODIGO_CLI : INT_3 INT_3 '-' INT_2                                                                             { System.out.print(" CODIGO_CLI: " + getText()); };
NOMBRE_CLI : STRING ', ' STRING                                                                                { System.out.print(" NOMBRE_CLI: " + getText()); };
TARIFA     : ('LLAMADA NACIONAL' | 'LLAMADA INTERNACIONAL' | 'MENSAJE DE TEXTO' | 'DESCARGA DE CONTENIDO')     { System.out.print(" TARIFA: "     + getText()); };
HORA       : ([0][0-9] | [1][0-9] | [2][0-3]) ':' [0-5][0-9] ':' [0-5][0-9]                                    { System.out.print(" HORA: "       + getText()); };
DURACION   : (INT_3 | INT_2 | INT)                                                                             { System.out.print(" DURACION: "   + getText()); };
IMPORTE    : (INT | INT_2 | INT_3)('.' INT_3)* ',' INT_2                                                       { System.out.print(" IMPORTE: "    + getText()); };
FECHA      : 
             (
                ( ([0][1-9] | [1][0-9] | [2][0-8]) '/' ([0][1-9] | [1][0-2])                               ) |
                ( ('29' | '30')                    '/' ([0]([1] | [3-9]) | [1][0-2])                       ) | 
                (  '31'                            '/' ([0]([1] | [3] | [5] | [7] | [8]) | [1]([0] | [2])) )
             )
                '/' ( (('19' | '20')[0-9][0-9]) | '2100' )                                                     { System.out.print(" FECHA: "      + getText()); };       

// REGLAS AUXILIARES
fragment INT    : [0-9];
fragment INT_2  : INT INT;            
fragment INT_3  : INT INT INT;
fragment STRING : [A-Z]+ ([A-Z] | ' ')*;
