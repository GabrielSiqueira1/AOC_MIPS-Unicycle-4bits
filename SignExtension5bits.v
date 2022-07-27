////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - SignExtension5bits.v
// Descricao - Extensor de sinal para entradas de 5 bits
//
// Entradas:
// in: Entrada que necessita de extensao
//
// Saidas:
// out: Saida estendida
//
// Funcionamento: A partir da entrada de um vetor com bits menores, ocorre uma concatenacao
// para complementar e tornar a entrada em 8 bits. Essa extensao realiza o processo
// de reconhecimento de sinal binario proveniente da instrucao.
////////////////////////////////////////////////////////////////////////////////

module SignExtension5bits(in,out);
input [4:0] in;
output reg [7:0] out;

reg [2:0] extend1 = 3'b000;
reg [2:0] extend2 = 3'b111;

always @(in)
	begin
		if (in[4]) begin
			out = {extend2, in};
		end
		else
		begin
			out = {extend1, in};
		end
	end
endmodule