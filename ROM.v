////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - ROM.v
// Descricao - Memoria de Instrucao
//
// Entradas:
// Address: E o endereco vindo do PC, a entrada e em 8 bits.
// Clock: Define se as altercoes ocorrerao na borda de subida ou descida do sinal.
//
// Saidas:
// Instruction: Saida de 8 bits.
//
// Funcionamento: E uma memoria de instrucoes, ou seja, uma memoria ROM, onde
// os processos ja foram previamente gravados como esta abaixo. Nesse caso, para
// funcionar da maneira correta, devemos ter um endereco no qual sera obtido do 
// PC definindo qual posicao da memoria de instrucoes sera utilizada, por exemplo:
// Seja o endereco obtido de PC o valor 18 em binario, ou seja, 10010; 
// Na memoria da instrucao sera buscado a instrucao que esta na posicao 18, portanto, rom[10010] = rom[18];
// O resultado da porta instruction, que e a saida do sistema, serao os bits obtidos de rom[10010];
////////////////////////////////////////////////////////////////////////////////

module ROM (input Clock, input [7:0] Address, output reg [7:0] Instruction);
	reg       [7:0] rom[0:255];  
	
	initial begin
		Instruction <= 8'b00000000;
	end
	
	integer i;
	
	initial begin  
		rom[0] = 8'b00000000;  
		rom[1] = 8'b00001010;  
		rom[2] = 8'b01101000;  
		rom[3] = 8'b00001011;  
		rom[4] = 8'b01101001;  
		rom[5] = 8'b00001011; 
		rom[6] = 8'b01101010;  
		rom[7] = 8'b00000100;  
		rom[8] = 8'b00001111;  
		rom[9] = 8'b01011110;  
		rom[10] = 8'b10100111;  
		rom[11] = 8'b10101001;  
		rom[12] = 8'b11000100;  
		rom[13] = 8'b00000000; 
		rom[14] = 8'b11001001;  
		rom[15] = 8'b11001110;  
		rom[16] = 8'b00000000; 
		rom[17] = 8'b11010101;
		rom[18] = 8'b01100111; 
		rom[19] = 8'b10000101; 
		rom[20] = 8'b00111000; 
		rom[21] = 8'b01101001; 
		rom[22] = 8'b10000110; 
		rom[23] = 8'b00111001; 
		rom[24] = 8'b01100110; 
		rom[25] = 8'b10000111; 
		rom[26] = 8'b00010110; 
		rom[27] = 8'b11010011; 
		rom[28] = 8'b00000000;
		rom[29] = 8'b11000110; 
		rom[30] = 8'b11010000; 
		rom[31] = 8'b10001000; 
		rom[32] = 8'b00001000; 
		rom[33] = 8'b01101000; 
		rom[34] = 8'b00010101; 
		rom[35] = 8'b11011001; 
		rom[36] = 8'b00000000; 
		rom[37] = 8'b11100000; 
	end 
	initial begin
		for (i = 38; i < 256; i = i + 1) begin
			rom[i] <= 8'b00000000;
		end
	end	
	always @(posedge Clock) begin
		Instruction <= rom[Address];
	end 	
endmodule