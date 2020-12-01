function fotoFinal = rotacao(foto)    
  rgb = foto;

  %gray = rgb2gray(color_p1);
  #figure, imshow(rgb)
  #title('resultado')

  nr = size(rgb, 1);
  nc = size(rgb, 2);

  r = rgb(:,:,1);
  g = rgb(:,:,2);
  b = rgb(:,:,3);

  r_g_b = [r g b];
  #figure, imshow(r_g_b)
  #title('r_g_b')

  red = imsubtract(r, g);
  #figure, imshow(red)
  #title('vermelho')

  th = graythresh(red);
  red = im2bw(red, th);
  se = strel("square", 7);
  red = imclose(red, se);
  se = strel("square", 3);
  red = imopen(red, se);
  #figure, imshow(red)
  #title('bw')

  rgbd = im2double(red);
  x = rgbd./max(rgbd(:));
  [center, radii, metric] = imfindcircles(x, [3 20]);
  #figure, imshow(rgbd)
  #title('rgbd')

  center = round(center);

  for j=1:1:3
    for i=1:1:3
      if center(i,2) < center(i+1,2);
        temp1 = center(i,2);
        temp2 = center(i,1);
        center(i,2) = center(i+1,2);
        center(i,1) = center(i+1,1);
        center(i+1,2) = temp1;
        center(i+1,1) = temp2;
      endif
    endfor
  endfor

  if center(1,1) > center(2,1);
    temp1 = center(1,2);
    temp2 = center(1,1);
    center(1,2) = center(2,2);
    center(1,1) = center(2,1);
    center(2,2) = temp1;
    center(2,1) = temp2;
  endif

  if center(3,1) < center(4,1);
    temp1 = center(3,2);
    temp2 = center(3,1);
    center(3,2) = center(4,2);
    center(3,1) = center(4,1);
    center(4,2) = temp1;
    center(4,1) = temp2;
  endif

  marcas = zeros(nr, nc);
  #figure, imshow(marcas, []);
  #hold on
  #viscircles(center(1,:),radii(1),'Color','b');
  #viscircles(center(2,:),radii(2),'Color','r');
  #viscircles(center(3,:),radii(3),'Color','g');
  #viscircles(center(4,:),radii(4),'Color','y');

  incp = [center(1,1) center(1, 2);center(2,1) center(2, 2);center(3,1) center(3, 2);center(4,1) center(4, 2)];

  outcp = [1 1500;850 1500;850 1;1 1];

  red = rgbd*255;
  #figure, imshow(red)
  #title('red de novo')

  T = maketform("projective", incp, outcp);
  [gProj] = imtransform(red, T);
  gProj = uint8(gProj);
  #figure, imshow(gProj)

  x = gProj./max(gProj(:));
  [center, radii, metric] = imfindcircles(x, [3 12]);

  center = round(center);

  for j=1:1:3
    for i=1:1:3
      if center(i,2) < center(i+1,2);
        temp1 = center(i,2);
        temp2 = center(i,1);
        center(i,2) = center(i+1,2);
        center(i,1) = center(i+1,1);
        center(i+1,2) = temp1;
        center(i+1,1) = temp2;
      endif
    endfor
  endfor

  if center(1,1) > center(2,1);
    temp1 = center(1,2);
    temp2 = center(1,1);
    center(1,2) = center(2,2);
    center(1,1) = center(2,1);
    center(2,2) = temp1;
    center(2,1) = temp2;
  endif

  if center(3,1) < center(4,1);
    temp1 = center(3,2);
    temp2 = center(3,1);
    center(3,2) = center(4,2);
    center(3,1) = center(4,1);
    center(4,2) = temp1;
    center(4,1) = temp2;
  endif

  [gProj] = imtransform(rgb, T);
  gProj = uint8(gProj);
  #figure, imshow(gProj)

  raio = round(0.025*(center(2, 1) - center(1, 1)));

  cropped = gProj((center(3, 2) + raio) : (center(2, 2) - raio), (center(1, 1) + raio) : (center(2, 1) - raio));
  fotoFinal = cropped;
  #figure, imshow(cropped)
endfunction
