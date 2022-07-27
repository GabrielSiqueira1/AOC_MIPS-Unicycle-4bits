////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - RAM.v
// Descricao - Memoria de dados
//
// Entradas:
// Address: o endreco que servira de posicao de armazenamento
// MemWriteData: dado vindo do registrador que sera armazenado na posicao address
// MemWrite: bit que define se um dado podera ser escrito em memoria
// MemRead: bit que define se um dado podera ser lido da memoria
// Clock: bit que define quando uma informacao sera alterada
// Reset: bit que zera a saida
//
// Saidas:
// MemReadData: apenas na instrucao load, define o valor lido da memoria
//
// Funcionamento: Com duas entradas interligadas a outros componentes diferentes 
// do controle, o Address e o MemWriteData vão sempre alterar read_data, quando MemWrite
// estiver ativo. Portanto o seu funcionamento é determinado da seguinte forma:
// address = 00011010 e write_data = 00000011, internamente, a memoria RAM fara o seguinte
// RAM [Address] = MemWriteData e quando MemRead e alterado, e possivel ver a saida no monitor
////////////////////////////////////////////////////////////////////////////////

module RAM (Address, MemWriteData, MemWrite, MemRead, Clock, MemReadData, Reset);

	input Reset;
	input wire [7:0] Address;    
	input wire [7:0] MemWriteData;  
	input wire MemWrite, MemRead;
	input wire Clock;                
	output reg [7:0] MemReadData;

	reg [7:0] RAM[255:0];
	integer i;
/*
	initial begin
		MemReadData <= 0;
		for (i = 0; i < 256; i = i + 1) begin
			RAM[i] <= 8'b00000000;
		end
	end
*/
	always @(posedge Clock) begin
	/*
		if (Reset == 1'b1) begin
			MemReadData <= 0;
			for (i = 0; i < 256; i = i + 1) begin
				RAM[i] <= 8'b00000000;
			end
		end
		else
		begin
		*/
			if (MemWrite == 1'b1) begin
				RAM[Address] <= MemWriteData;
			end
			if (MemRead == 1'b1) begin
				MemReadData <= RAM[Address];
			end
			
			
		//end
	end
	/*
	always @(negedge Clock) begin
		if (Reset == 1'b1) begin
			MemReadData <= 0;
			for (i = 0; i < 256; i = i + 1) begin
				RAM[i] <= 8'b00000000;
			end
		end
		else
		begin
			if (MemRead == 1'b1) begin
				MemReadData <= RAM[Address];
			end
		end
	end
	*/
endmodule