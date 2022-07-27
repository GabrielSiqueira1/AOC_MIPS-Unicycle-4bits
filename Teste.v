`include "Datapath.v"
`include "RAM.v"

module Teste;
	reg CLK, Reset;
	wire [7:0] resultadoDaULA, dadoParaMemoria, dadoParaNRisc;
	wire sinalEscrita, sinalLeitura;
	

	Datapath mod1(CLK, Reset, resultadoDaULA, dadoParaMemoria, sinalEscrita, sinalLeitura, dadoParaNRisc);
	RAM mod2(resultadoDaULA, dadoParaMemoria, sinalEscrita, sinalLeitura, CLK, dadoParaNRisc, Reset);
	
	initial begin
		forever
		begin       
			#1	CLK = ~CLK;
		end
	end
	
	initial begin
		CLK = 1'b0; Reset = 1'b0;
	end
	
	initial begin
	forever
	begin 
		$display("Dados do sistema");
		$display("Time=%0d Clock=%b Reset=%b", $time, CLK, Reset);		
		$display("PC=%b Instrucao=%b", mod1.PC, mod1.Inst);
		$display("OPCode=%b", mod1.Inst[7:5]);
		$display("Sinais:                              PCWrite=%b Regdst=%b Jump=%b Branch=%b MemRead=%b MemWrite=%b MemtoReg=%b RegWrite=%b ALUOp=%b ALUSrc=%b", mod1.PCWrite, mod1.Regdst, mod1.Jump, mod1.Branch, mod1.MemRead, mod1.MemWrite, mod1.MemtoReg, mod1.RegWrite, mod1.ALUOp, mod1.ALUSrc);
		$display("MUX antes do banco de registradores: Entrada 1=%b Entrada 2=%b Saida do MUX=%b", mod1.Inst[3:2], mod1.Inst[1:0], mod1.MUXReg);
		$display("No banco de registradores:           Entrada 1=%b Entrada 2=%b Entrada 3=%b Dado a ser escrito no registrador=%b", mod1.Inst[4], mod1.Inst[3:2], mod1.MUXReg, mod1.MUX_ALU_MEMtoReg);
		$display("No banco de registradores:           Saida 1=%b Saida 2=%b", mod1.Data1, mod1.Data2);
		$display("Sinais estendidos:                   Sinal de 2 bits=%b Sinal de 5 bits=%b", mod1.Signal2to8, mod1.Signal5to8);
		$display("Operadores da ULA:                   Primeira entrada=%b Segunda entrada=%b", mod1.Data1, mod1.MUXAlu);
		$display("Resultado da ULA=%b Saida da memoria=%b", mod1.ALUResult, mod1.RAMResult);
		$display("Outras informacoes:                  Resultado que sera colocado no registrador=%b Desvio condicional=%b", mod1.MUX_ALU_MEMtoReg, mod1.MUXBranch);
		$display("$0=%b",mod1.bloco4.RF[0]);
		$display("$1=%b",mod1.bloco4.RF[1]);
		$display("$2=%b",mod1.bloco4.RF[2]);
		$display("$3=%b",mod1.bloco4.RF[3]);
		$display("RAM[0]=%b",mod2.RAM[0]);
		$display("RAM[1]=%b",mod2.RAM[1]);
		$display("RAM[2]=%b",mod2.RAM[2]);
		$display("RAM[3]=%b",mod2.RAM[3]);
		$display("-----------------------------------------------");
		#1;
		end
	end
	initial begin
	forever
	begin
	    if(mod1.Inst[7:5] == 3'b111)
            $finish;
            #1;
        end
    end
endmodule