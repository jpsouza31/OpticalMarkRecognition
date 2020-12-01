function printRespostas(respostas)
  for i = 1:50
    if(respostas(i) == -1)
      alternativaFinal = "Mais de uma alternativaa marcadaa, questão anulada!!";
    elseif(respostas(i) == 0)
      alternativaFinal = "Nenhuma alternativa marcada!!";
    elseif(respostas(i) == 1)
      alternativaFinal = "A";
    elseif(respostas(i) == 2)
      alternativaFinal = "B";
    elseif(respostas(i) == 3)
      alternativaFinal = "C";
    elseif(respostas(i) == 4)
      alternativaFinal = "D";
    elseif(respostas(i) == 5)
      alternativaFinal = "E";
    endif
    
    X = sprintf('Questão %d: %s',i,alternativaFinal);
    disp(X) 
  endfor
endfunction
