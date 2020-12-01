function imagemBW = preparaImagem(imagem)
  imagem = rotacao(imagem);

  # Segmentação das imagens
  T = graythresh(imagem);
  imagemBW = im2bw(imagem,T);

  # Morfologia para deixar apenas os retangulos das alternativas
  SE = strel('square', 4);
  imagemBW = imclose(imagemBW,SE);

  SE = strel('square', 2);
  imagemBW = imerode(imagemBW,SE);
endfunction
