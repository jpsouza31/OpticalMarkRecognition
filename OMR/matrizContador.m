function contadorGabarito = matrizContador(gabaritoBW)
  
  [Ignl Ignc] = size(gabaritoBW);

  gabaritoInv = ~gabaritoBW;

coluna = sum(gabaritoInv, 1);
for j=1:1:4
  for i=(1 + round(Ignc/4)*(j-1)):1:(round(Ignc/4)*(j) - 10)
    media(i) = coluna(i) + coluna(i+1) + coluna(i+2) + coluna(i+3) + coluna(i+4) + coluna(i+5) + coluna(i+6) + coluna(i+7) + coluna(i+8) + coluna(i+9);
  endfor
  mediaLocal = media((1 + round(Ignc/4)*(j-1)):(round(Ignc/4)*(j) - 10));
  laterais(j) = find(mediaLocal==max(mediaLocal)) + round(Ignc/4)*(j-1) + 5;
endfor

for j=1:1:4
  if j==1
    inicial = 1;
    final = 200;
    posicao = 200;
    passo = 1;
  elseif j==2
    inicial = 1450;
    final = 1300;
    posicao = 200;
    passo = -1;
  elseif j==3
    inicial = 1;
    final = 200;
    posicao = 700;
    passo = 1;
  else
    inicial = 1450;
    final = 1300;
    posicao = 700;
    passo = -1;
  endif
  for i=inicial:passo:final
    if gabaritoInv(i, posicao)==1
      topos(j) = i;
      break;
    endif
  endfor
endfor

altura(1) = round((topos(2)-topos(1))/26);
margem(1) = round(altura(1)/5);
altura(2) = round((topos(4)-topos(3))/25);
margem(2) = round(altura(2)/5);

for coluna=1:2
  if coluna==1
    topo = 1;
    questoes = 26;
  else
    topo=3;
    questoes = 25;
  endif 
  for n=1:questoes
    posY1 = (topos(topo)+margem(coluna)+(n-1)*altura(coluna));
    posY2 = (posY1 + round(altura(coluna)*2/3) - margem(coluna));
    posX1 = (laterais(topo)+margem(coluna));
    posX2 = (laterais(topo + 1)-margem(coluna));
    recorte = gabaritoBW(posY1 : posY2, posX1 : posX2);
    for alternativa = 1:1:5
      h = size(recorte, 1)-1;
      largura = round(size(recorte, 2)/5)-1;
      contador((n + 26*(coluna - 1)),alternativa) = 0;
      for i=1:1:h
        for j=(((alternativa-1)*largura)+1):1:(largura + (((alternativa-1)*largura)))
          contador((n + 26*(coluna - 1)),alternativa) = contador((n + 26*(coluna - 1)),alternativa) + ((recorte(i, j) - 1)*(-1));
        endfor
      endfor
    endfor
  endfor
endfor

contadorGabarito = contador;

endfunction
