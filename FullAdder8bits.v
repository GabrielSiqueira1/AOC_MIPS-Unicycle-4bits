////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - FullAdder8bits.v
// Descricao - Somador completo de 8 bits
//
// Entradas:
// A: Primeira entrada. Primeiro operador
// B: Segundo operador
//
// Saidas:
// S: Saída de 8 bits
//
// Funcionamento: Utiliza o módulo menor, somador de 1 bit, para realizar as operacoes
// em cada bit do vetor, e ainda, usando um fio Carry para interliga-los. O carry input
// comeca em zero pois o codigo ja realizou o complemento de 2
////////////////////////////////////////////////////////////////////////////////

module FullAdder8bits(A,B,S);
input [7:0]A;
input [7:0]B;
output [7:0]S;

wire [7:0]Carry;

FullAdder1bit Bloco1(A[0],B[0],S[0],1'b0,Carry[0]);
FullAdder1bit Bloco2(A[1],B[1],S[1],Carry[0],Carry[1]);
FullAdder1bit Bloco3(A[2],B[2],S[2],Carry[1],Carry[2]);
FullAdder1bit Bloco4(A[3],B[3],S[3],Carry[2],Carry[3]);
FullAdder1bit Bloco5(A[4],B[4],S[4],Carry[3],Carry[4]);
FullAdder1bit Bloco6(A[5],B[5],S[5],Carry[4],Carry[5]);
FullAdder1bit Bloco7(A[6],B[6],S[6],Carry[5],Carry[6]);
FullAdder1bit Bloco8(A[7],B[7],S[7],Carry[6],Carry[7]);

endmodule