module Datapath(Clk, Reset, ALUResult, Data2, MemWrite, MemRead, RAMResult);

input Clk, Reset;
wire [7:0] PCNext, PCBeq;

output [7:0] ALUResult, Data2, RAMResult;
output MemWrite, MemRead;

wire [7:0] Inst;
// Sinais
wire PCWrite, Regdst, Jump, Branch, MemRead, MemWrite, MemtoReg, RegWrite;
wire [1:0] ALUOp, ALUSrc;

// Do registrador
wire [1:0] MUXReg;
wire [7:0] Data1, Data2;

//ALU
wire [7:0] Signal2to8, Signal5to8, MUXAlu;
wire [7:0] ALUResult;
wire SignalZero, MUXBranch;

// PC
reg [7:0] PC;
wire [7:0] MUX_ALU_MEMtoReg, RAMResult;

// PC
initial begin
	PC <= 8'b00000000;
end

// Memoria de instrucao
ROM bloco1(.Clock(Clk), .Instruction(Inst), .Address(PC));

// Controle
Ctrl bloco2(Inst[7:5], Reset, Clk, PCWrite, Regdst, Jump, Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUOp, ALUSrc);

// MUX proximo ao registrador
Mux2to1Reg bloco3(Inst[3:2], Inst[1:0], Regdst, MUXReg);

// Register File
registerFile bloco4(Inst[4], Inst[3:2], MUXReg, MUX_ALU_MEMtoReg, RegWrite, Data1, Data2, Clk, Reset, MemRead);

// Intermediaries
SignExtension2bits bloco5(Inst[1:0], Signal2to8);
SignExtension5bits bloco6(Inst[4:0], Signal5to8);
Mux3to1 bloco7(Data2, Signal2to8, Inst[1:0], ALUSrc, MUXAlu);

// ALU
ALU bloco8(Data1, MUXAlu, ALUOp, ALUResult, SignalZero);

Mux2to1 bloco10(ALUResult, RAMResult, MemtoReg, MUX_ALU_MEMtoReg);

assign MUXBranch = SignalZero & Branch;

always @(posedge Clk) begin
	if(Inst[7:5] != 3'b111)begin
		case({MUXBranch,Jump}) 
			2'b00:  PC <= PC + 8'b00000001;
			2'b01:  PC <= PC + 8'b00000001 + Signal5to8;
			2'b10:  PC <= PC + 8'b00000001 + Signal2to8;
			default: ;
		endcase
	end
end

endmodule