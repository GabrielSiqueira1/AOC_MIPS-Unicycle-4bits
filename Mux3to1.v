////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - Mux3to1.v
// Descricao - Multiplexador 3 entradas e 1 saida
//
// Entradas:
// In1 - Primeira entrada do mux
// In2 - Segunda entrada do mux
// In3 - Terceira entrada do mux
// Signal - Seletor de saida
//
// Saidas:
// out - Entrada determinada pelo sinal
//
// Funcionamento: A partir do sinal adqurido do controle, escolhe-se qual entrada
// ira sair
////////////////////////////////////////////////////////////////////////////////

module Mux3to1(In1, In2, In3, Signal, out);
input [7:0] In1, In2;
input [1:0] In3; 
input [1:0] Signal;
output reg [7:0] out;
initial begin
	out <= 8'b00000000;
end

always @(In1, In2, In3, Signal)
	case (Signal)
		0: out <= In1;
		1: out <= In2;
		2: out <= {6'b000000,In3};
		default: out <= {6'b000000,In3};
	endcase
endmodule