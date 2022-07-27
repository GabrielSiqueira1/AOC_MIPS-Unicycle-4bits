////////////////////////////////////////////////////////////////////////////////
// 2ECOM.023 - Laboratorio de Arquitetura e Organizacao de Computadores 1
// Modulo - PCAdder.v
// Descricao - Somador para PC
//
// Entradas:
// PCResult: Essa entrada e o resultado que sai do modulo de PC
//
// Saidas:
// PCAdd: E a saida do modulo de PC com a soma de 1
//
// Funcionamento: Utiliza a saida do componente PC para somar com 1 e saltar uma
// instrucao. Por esse motivo todas as contagens de deslocamento sao referentes a PC+1
////////////////////////////////////////////////////////////////////////////////

module PCAdder(PCResult, PCAdd);

    input   [7:0]  PCResult;
    output reg [7:0]  PCAdd;

    always @(PCResult)
    begin
    	PCAdd <= PCResult + 8'b00000001;
    end

endmodule