function tipo = getTipo(contador)
  tipoMedia = mean(contador(1,1:4));
  count = 0;
  tipo = -1;

  for n = 1:4
    if(contador(1,n) > contador)
      if(tipo == 1)
        return;
      endif
        tipo = n;
        count = count + 1;
      endif
  endfor
endfunction
