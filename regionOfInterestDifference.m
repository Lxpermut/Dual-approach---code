%% image 1
rgb1 = imread('WL2N_Sky_1.png');
lab1 = rgb2lab(rgb1);
%% extracting L lightness channel
Llab1=lab1(:,:,1);
[size1X, size1Y]=size(Llab1);
%% Image 2
rgb2 = imread('WL2N_Sky_2.png');
lab2 = rgb2lab(rgb2);
%% extracting L lightness channel
Llab2=lab2(:,:,1);
[size2X, size2Y]=size(Llab2);

if (size1X ~= size2X & size1Y ~= size2Y)
    error("matrices don't have the same length!!!");
end

%% Calculate change and non-change counters
changeCounter=0;
nonChangeCounter=0;
for j=1:size1X
    for k=1:size1Y
        if (Llab1(j,k) == 0 & Llab2(j,k) == 0)
            continue;
        end
        if (abs(Llab1(j,k))-abs(Llab2(j,k)) == 0)
            nonChangeCounter=nonChangeCounter+1;
        else
            changeCounter=changeCounter+1;
        end
    end
end

%% Percentage calculation
total=nonChangeCounter+changeCounter;
nonChangePercentage=(nonChangeCounter/total) * 100;
changePercentage=(changeCounter/total) * 100;

disp(['Changes Percentage: ',num2str(changePercentage), '%']);
disp(['Non changes percentage: ',num2str(nonChangePercentage), '%']);

