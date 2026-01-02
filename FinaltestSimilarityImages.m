%images_arr 
images_arr = ["00RF1V.jpg", "01RF1V.jpg","02RF1V.jpg","03RF1V.jpg","04RF1V.jpg","05RF1V.jpg","06RF1V.jpg","07RF1V.jpg","08RF1V.jpg","09RF1V.jpg","10RF1V.jpg","11RF1V.jpg","12bRF1V.jpg","13RF1V.jpg","14RF1V.jpg","15RF1V.jpg","16RF1V.jpg","17RF1V.jpg","18RF1V.jpg","19RF1V.jpg","20RF1V.jpg"];
vectors = cell(1);
for i=1:length(images_arr)
    rgb = imread(images_arr(i));
    lab = rgb2lab(rgb);
    Llab=lab(:,:,1);
    gg = reshape(Llab',1,numel(Llab));
    vectors{i} = gg(1,:);
end

simArr = double.empty(length(images_arr),0);

for j=1:length(images_arr)
    for k=1:length(images_arr)
        simArr(j, k) = dot(vectors{j},vectors{k})/(norm(vectors{j})*norm(vectors{k}));
    end
end

 %% Plot
 heatmap(simArr)

