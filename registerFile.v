////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - registerFile.v
// Descricao - Registradores
//
// Entradas:
// Read1: Leitor de 1 bit, representa os registradores de $0, $1
// Read2: Leitor de 2 bits, representa os registradores de $2, $3
// WriteReg: Leitor de 2 bits, representa os registradores de $2, $3, o MUX selecionara entre Read2 e WriteReg
// WriteData: O valor escrito em um registradores
// RegWrite: Sinal do controle, permite a escrita em registradores
// Clock: Define se as altercoes ocorrerao na borda de subida ou descida do sinal
// Reset: Zera as saidas do dispositivo
//
// Saidas:
// Data1: Uma saida de 8 bits que recebe o valor de um registrador lido
// Data2: Uma saida de 8 bits que recebe o valor de um registrador lido
//
// Funcionamento: A partir dos registradores lidos, obtem-se os seus valores já armazenados
// no array determinado internamente, ou seja, se o registrador for $2, o valor deste 
// estará armazenado no vetor RF, na posição 2, RF[00000010].
// Toda vez que for uma borda de subida e que o registrador de escrita estiver habilitado
// ocorrera uma escrita em um registrador determinado.
////////////////////////////////////////////////////////////////////////////////

module registerFile(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, Clock, Reset, ReadMem);
	input Read1, Reset, Clock;
	input [1:0] Read2, WriteReg;
	input [7:0] WriteData;
	input RegWrite, ReadMem;
	
	integer i;
	
	output [7:0] Data1, Data2;

	reg [7:0] RF [3:0];
	
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			RF[i] <= 8'b00000000;
		end
	end
	
	assign Data1 = RF[Read1]; 
	assign Data2 = RF[Read2];
	always begin @(posedge Clock) 
    	begin
			if (Reset == 1'b1)
				begin
					for (i = 0; i < 4; i = i + 1) begin
						RF[i] <= 8'b00000000;
					end
				end
			else
			begin
				if (RegWrite == 1'b1)
				begin
					RF[WriteReg] <= WriteData;
				end
			end
		end
	end
	always begin @(negedge Clock) 
    	begin
			if (Reset == 1'b1)
				begin
					for (i = 0; i < 4; i = i + 1) begin
						RF[i] <= 8'b00000000;
					end
				end
			else
			begin
				if (RegWrite == 1'b1 & ReadMem == 1'b1)
				begin
					RF[WriteReg] <= WriteData;
				end
			end
		end
	end
endmodule