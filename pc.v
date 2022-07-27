////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - pc.v
// Descricao - Contador do programa
//
// Entradas:
// PCin: Uma entrada de 8 bits contendo a posicao de uma instrucao. Sera 
// utilizado para identificar qual e a instrucao na memoria de instrucoes.
// Reset: Sinal de 1 bit para resetar o processo, retorna ao inicio.
// Clock: Define se as altercoes ocorrerao na borda de subida ou descida do sinal.
// PCWrite: Propoe uma limitacao a escrita em PC, caso halt seja a instrucao,
// nenhuma informacao de PC podera ser alterada.
//
// Saidas:
// PCout: Saida de 8 bits.
//
// Funcionamento: Central de contagem do processador. E necessario para que a
// partir da sua saida, seja escolhido a instrucao correta. A saida é definida por
// PCout; esse começa em 00000000 e nesses bits de saida ocorrem as alteracoes
// de acordo com os valores da entrada PCin. Para que a substituicao dos valores
// da saída aconteca, e necessario que PCWrite esteja habilitado.
// Caso seja preciso que o processador volte ao inicio, existira o sinal de reset
// e todas as alteracoes ocorrerao quando o sinal de CLOCK determinar, nesse caso
// sempre que for uma borda de subida.
//
// Nota: Tudo esta sem acentuacao
////////////////////////////////////////////////////////////////////////////////

module pc(PCin, PCout, Reset, Clock, PCWrite);

	input       [7:0]  PCin;
	input              Reset, Clock, PCWrite;
	output reg  [7:0]  PCout;

	initial begin
		PCout <= 8'b00000000;
	end

    always @(posedge Clock) 
	begin
		if (Reset == 1'b1)
		begin
			PCout <= 8'b00000000;
		end
    	else
    	begin
			if (PCWrite == 1'b1) 
			begin
				PCout <= PCin;
			end
    	end
    end

endmodule