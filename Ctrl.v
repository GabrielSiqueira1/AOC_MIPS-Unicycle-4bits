////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - Ctrl.v
// Descricao - Controller
//
// Entradas:
// OPCode - Os tres bits mais significativos da instrucao, determina quais componentes funcionarao
// Reset - Coloca todos os sinais em 0, habilita apenas PC
// Clock - Estabelece quando o controle podera alterar a saida
//
// Saidas:
// PCWrite - Controla o sinal de escrita em PC
// Regdst - Controla os bits que serao registrados
// Jump - Controla o sinal de salto incondicional
// Branch - Controla o sinal de salto condicional
// MemRead - Controla a leitura na memoria de dados
// MemWrite - Controla a escrita na memoria de dados
// RegWrite - Controla se a ALU ou a RAM escrevera nos registradores
// ALUOp - Controla as operacoes da ALU
// ALUSrc - Controla quem sera a segunda entrada da ALU
//
////////////////////////////////////////////////////////////////////////////////

module Ctrl(OPCode, Reset, Clock, PCWrite, Regdst, Jump, Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUOp, ALUSrc);

	input[2:0] OPCode;  
    input Reset, Clock;  
    output reg PCWrite, Regdst, Jump, Branch, MemRead, MemWrite, MemtoReg, RegWrite;
	output reg [1:0] ALUOp, ALUSrc;


always @(posedge Clock or negedge Clock)  
begin  
	  if(Reset == 1'b1) 
			begin  
				PCWrite = 1'b1;
				Regdst = 1'b0; 
				Jump = 1'b0;		
				Branch = 1'b0; 
				MemRead = 1'b0; 
				MemWrite = 1'b0; 
				MemtoReg = 1'b0;  
				ALUOp = 2'b00;    	 
				ALUSrc = 2'b00;  
				RegWrite = 1'b0;  
			end  
	  else 
			begin  
			  case(OPCode)   
			  3'b000: 
					begin // addi 
						PCWrite = 1'b1;
						Regdst = 1'b0; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b00;    	 
						ALUSrc = 2'b01;  
						RegWrite = 1'b1;    
					end  
			  3'b001: 
					begin // sll
						PCWrite = 1'b1;
						Regdst = 1'b1; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b11;    	 
						ALUSrc = 2'b10;  
						RegWrite = 1'b1; 
					end  
			  3'b010: 
					begin // slt  
						PCWrite = 1'b1;
						Regdst = 1'b1; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b10;    	 
						ALUSrc = 2'b00;  
						RegWrite = 1'b1;   
					end  
			  3'b011: 
					begin // sw  
						PCWrite = 1'b1;
						Regdst = 1'b0; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b1; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b00;    	 
						ALUSrc = 2'b01;  
						RegWrite = 1'b0;
					end  
			  3'b100: 
					begin // lw  
						PCWrite = 1'b1;
						Regdst = 1'b0; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b1; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b1;  
						ALUOp = 2'b00;    	 
						ALUSrc = 2'b01;  
						RegWrite = 1'b1;
					end  
			  3'b101: 
					begin // beq  
						PCWrite = 1'b1;
						Regdst = 1'b0; 
						Jump = 1'b0;		
						Branch = 1'b1; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b01;    	 
						ALUSrc = 2'b00;  
						RegWrite = 1'b0; 
					end  
			  3'b110: 
					begin // j 
						PCWrite = 1'b1;
						Regdst = 1'b0; 
						Jump = 1'b1;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b00;    	 
						ALUSrc = 2'b00;  
						RegWrite = 1'b0; 
					end  
			  3'b111: 
					begin // halt  
						PCWrite = 1'b0;
						Regdst = 1'b0; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b00;    	 
						ALUSrc = 2'b00;  
						RegWrite = 1'b0;  
					end  
			  default: 
					begin  
						PCWrite = 1'b1;
						Regdst = 1'b1; 
						Jump = 1'b0;		
						Branch = 1'b0; 
						MemRead = 1'b0; 
						MemWrite = 1'b0; 
						MemtoReg = 1'b0;  
						ALUOp = 2'b10;    	 
						ALUSrc = 2'b00;  
						RegWrite = 1'b1; 
					end  
			endcase  
	  end  
 end  
 endmodule  