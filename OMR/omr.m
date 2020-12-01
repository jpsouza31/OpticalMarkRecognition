clear all, close all, clc

gabarito = imread('gabarito.jpg');
prova = imread('aluno.jpg');

gabaritoBW = preparaImagem(gabarito);
provaBW = preparaImagem(prova);

gabaritoContador = matrizContador(gabaritoBW);
provaContador = matrizContador(provaBW);

tipoGabarito = getTipo(gabaritoContador);
tipoProva = getTipo(provaContador);

if isnan(tipoGabarito)
   display('Mais de um tipo de gabarito assinalado, gabarito anulado!!')
   return;
end

if isnan(tipoProva)
   display('Mais de um tipo de prova assinalada, prova anulada!!')
   return;
end


# Verifica se a prova e o gabarito s√£o do mesmo tipo
if (tipoGabarito != tipoProva)
   display('Gabarito e prova n„o s„o do mesmo tipo!!')
   return;
endif 

# Localiza as alternativas marcadas
gabaritoRespostas = getRespostas(gabaritoContador);
provaRespostas = getRespostas(provaContador);
    
# Computa a pontua√ß√£o da prova
disp("\n\n*** GABARITO ***")
printRespostas(gabaritoRespostas);

disp("\n\n*** PROVA ***")
printRespostas(provaRespostas);

resultadoFinal = getResultadoFinal(gabaritoRespostas, provaRespostas);

X = sprintf('\n\nRESULTADO FINAL: %d questıes assinaladas corretamente',resultadoFinal);
disp(X)

X = sprintf('Nota: %d',(resultadoFinal*10)/50);
disp(X)