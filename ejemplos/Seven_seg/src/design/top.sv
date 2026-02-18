module top (
    input logic [3:0] sw,           // A (MSB), B,C,D.. Del 0 al 3 hay 4 bits
    output logic [6:0] segments    
);

    /* Esta seccion de codigo no representa nada funcional, solo se asigna un nombre a 
    cada bit para escribir las ecuaciones boooleanas con mayor facilidad.
    Como renombrar un nodo.     */
assign A = sw[3];
assign B = sw[2];
assign C = sw[1];
assign D = sw[0];
    //

    /*Esta seccion de codigo presenta la logica booleana necesaria para las salidas del sistema, 
    las cuales se deben conectar a un respectivo segmento del display.*/

assign segments[0] = (A) |               // segmento A
                    (B & ~C) |
                    (~B & C) |
                    (C & ~D);  

assign segments[1] = (A & ~B & ~C) |     // segmento B
                    (~A & B & ~C) |
                    (~A & B & ~D) |
                    (~A & ~C & ~D); 

assign segments[2] = (~A & C & ~D) |     // segmento C
                    (~B & ~C & ~D);        

assign segments[3] = (~A & ~B & C) |     // segmento D
                    (~A & C & ~D) |
                    (~B & ~C & ~D) |
                    (~A & B & ~C & D);

assign segments[4] = (~A & B) |          // segmento F
                    (~A & D) |
                    (~B & ~C);

assign segments[5] = (~A & ~B) |         // segmento E
                    (~B & ~C) |
                    (~A & C & D) |
                    (~A & ~C & ~D); 

assign segments[6] = (~A & C) |         // segmento G
                    (~A & B & D) |
                    (A & ~B & ~C) |
                    (~A & ~B & ~D);                            
    
endmodule