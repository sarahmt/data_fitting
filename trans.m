im_out = 'sugar.png';

% name the input and output files
im_src = 'temp.png';

% read in the source image (this gives an m * n * 3 array)
RGB_in = imread( im_src );
[m, n] = size( RGB_in(:,:,1) );

% locate the pixels whose RGB values are all 255 (white points ? --to be verified)
idx1 = ones(m, n);
idx2 = ones(m, n);
idx3 = ones(m, n);
idx1( RGB_in(:,:,1) == 255 ) = 0;
idx2( RGB_in(:,:,2) == 255 ) = 0;
idx3( RGB_in(:,:,3) == 255 ) = 0;

% write to a PNG file, 'Alpha' indicates the transparent parts
trans_val = idx1 .* idx2 .* idx3;
imwrite( RGB_in, im_out, 'png', 'Alpha', trans_val );
