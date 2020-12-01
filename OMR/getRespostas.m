function respostas = getRespostas(contador)
  threshold = 100;
  respostas = zeros(50, 1);
  media = mean(contador(1,1:5));

  for i = 2:51
    for j = 1:5   
      if(contador(i,j) > media + threshold)
        if(respostas(i-1,1) != 0)
          respostas(i-1,1) = -1;
          break;
        else
          respostas(i-1,1) = j;
        endif      
      endif  
     endfor
  endfor
endfunction
