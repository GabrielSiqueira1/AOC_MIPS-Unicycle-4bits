////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - FullAdder1bit.v
// Descricao - Somador completo de 1 bit
//
// Entradas:
// A: Primeira porta. Primeiro operador
// B: Segunda porta. Segundo operador
// Cin: Carry in, conector de portas
//
// Saidas:
// S: Saida de 1 bit
// Cout: Saida de 1 bit, representa o carry out
//
// Funcionamento: Realiza a tarefa:
//
// (Carry in) + 0 + 0
// (Carry in) + 1 + 0
// (Carry in) + 0 + 1
// (Carry in) + 1 + 1
//
////////////////////////////////////////////////////////////////////////////////

module FullAdder1bit(A,B,S,Cin,Cout);
input A,B,Cin;
output S,Cout;

assign S = (A ^ Cin) ^ B;
assign Cout = (A&B) | (A&Cin) | (B&Cin);

endmodule