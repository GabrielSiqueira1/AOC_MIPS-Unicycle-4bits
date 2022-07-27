////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - AND.v
// Descricao - Porta and
//
// Entradas:
// in1: Entrada de 1 bit  
// in2: Segunda entrada de 1 bit, sera comparada com a primeira
//
// Saidas:
// out: resultado da tabela verdade
//
// Funcionamento: Realiza a tabela verdade da porta AND
//
// 0 & 0 = 0
// 1 & 0 = 0
// 0 & 1 = 0
// 1 & 1 = 1
//
////////////////////////////////////////////////////////////////////////////////

module And(in1, in2, out);
	input in1, in2;
	output out;

	assign out = in1 & in2;
endmodule