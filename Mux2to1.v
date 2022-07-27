////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - Mux2to1.v
// Descricao - Multiplexador 2 entradas e 1 saida
//
// Entradas:
// In1 - Primeira entrada do mux
// In2 - Segunda entrada do mux
// Signal - Seletor de saida
//
// Saidas:
// out - Entrada determinada pelo sinal
//
// Funcionamento: A partir do sinal adqurido do controle, escolhe-se qual entrada
// ira sair
////////////////////////////////////////////////////////////////////////////////

module Mux2to1(In1, In2, Signal, out);
input [7:0] In1, In2; 
input Signal;
output reg [7:0] out;

always @(In1, In2, Signal)
	case (Signal)
		0: out <= In1;
		1: out <= In2;
		default: out <= In2;
	endcase
endmodule