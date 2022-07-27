////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - ALU.v
// Descricao - Unidade de Logica e Aritmetica
//
// Entradas:
// A - Primeiro operador da ALU
// B - Segundo operador da ALU
// ALUControl - Sinal de controle que determina que operacao sera realizada
//
// Saidas:
// Result - E a saida que representa os resultados da operacao
// Zero - E o sinal que se ativa quando dois termos tem valores iguais, para um
// possivel desvio
//
// Funcionamento: Com duas entradas provenientes do banco de registradores ou 
// diretamente da instrução, a ALU realizara o calculo de acordo com o valor do
// sinal de controle. Todas as operacoes tem resultados que sao armazenados no 
// Result, e apenas quando a instrucao e do tipo beq, o sinal Zero tem a possibi
// lidade de ser ativo.
////////////////////////////////////////////////////////////////////////////////

module ALU(A, B, ALUControl, Result, Zero);

	input   [1:0]   ALUControl;
	input   [7:0]   A, B;
	
	output  reg [7:0]  Result;
	output      Zero;

always @(ALUControl, A, B)
begin   
	case(ALUControl)  
		2'b00: Result <= A + B; // add  
		2'b01: Result <= A - B; // sub 
		// slt
		2'b10:  begin 
					if (A<B)
					begin
						Result <= 8'b1;
					end
					else 
					begin
						Result <= 8'b0;
					end
				end 
		2'b11: Result <= A << (B); // sll 
		default:Result <= A + B; // add  
	endcase  
end  
assign Zero = (Result == 8'b0 & ALUControl == 2'b01) ? 1'b1: 1'b0;  
endmodule  