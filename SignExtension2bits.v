////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - SignExtension2bits.v
// Descricao - Extensor de sinal para entradas de 2 bits
//
// Entradas:
// in: Entrada que necessita de extensao
//
// Saidas:
// out: Saida estendida
//
// Funcionamento: A partir da entrada de um vetor com bits menores, ocorre uma concatenacao
// para complementar e tornar a entrada em 8 bits
////////////////////////////////////////////////////////////////////////////////

module SignExtension2bits(in,out);
input [1:0] in;
output reg[7:0] out;

reg [5:0] extend = 6'b000000;

always @(in)
	begin
		out <= {extend, in};
	end
endmodule