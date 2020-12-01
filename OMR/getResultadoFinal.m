function final = getResultadoFinal(gabaritoRespostas, provaRespostas)
  final = 0;
  for i = 1:50
    if (gabaritoRespostas(i) == -1 || gabaritoRespostas(i) == 0)
      final = final + 1;
    elseif(provaRespostas(i) != -1 && provaRespostas(i) != 0 && gabaritoRespostas(i) == provaRespostas(i))
      final = final + 1;
    endif
  endfor
endfunction
