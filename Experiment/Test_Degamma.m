list = dir([pwd filesep 'Images_PILOT' filesep 'Face*.jpg']);

img_adj = repmat({zeros(1080,1920,3,'uint8')},2,5);

for i = 1:numel(list)
    img = imread([list(i).folder filesep list(i).name]);
    img = imresize(img,[1080 1920]);
    
    if i==1
        img = imadjust(img,[],[],1/log(2.2));
        zone = img(1:100,1:100,:);
        zone_colout_target = squeeze(mean(mean(zone)));
    else
        gammas = [1 : 0.05 : 2];
        for g = 1:length(gammas)
            img_test = imadjust(img,[],[],gammas(g));
            zone = img_test(1:100,1:100,:);
            zone_colout = squeeze(mean(mean(zone)));
            zone_diff(g) = pdist([zone_colout'; zone_colout_target']);
        end
        [~,g] = min(zone_diff);
        img = imadjust(img,[],[],gammas(g));
    end
    
    img_adj{i} = img;
    
end

img = cell2mat(img_adj);
imshow(img);
axis image