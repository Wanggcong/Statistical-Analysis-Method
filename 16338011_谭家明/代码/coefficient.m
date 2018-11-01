function co = coefficient()
stock = cell(1*100);
stock{1,1}=importdata('000001.csv');
stock{1,2}=importdata('000006.csv');
stock{1,3}=importdata('000012.csv');
stock{1,4}=importdata('000014.csv');
stock{1,5}=importdata('000016.csv');
stock{1,6}=importdata('000021.csv');
stock{1,7}=importdata('000025.csv');
stock{1,8}=importdata('000026.csv');
stock{1,9}=importdata('000027.csv');
stock{1,10}=importdata('000028.csv');
stock{1,11}=importdata('000036.csv');
stock{1,12}=importdata('000039.csv');
stock{1,13}=importdata('000043.csv');
stock{1,14}=importdata('000046.csv');
stock{1,15}=importdata('000049.csv');
stock{1,16}=importdata('000055.csv');
stock{1,17}=importdata('000059.csv');
stock{1,18}=importdata('000060.csv');
stock{1,19}=importdata('000062.csv');
stock{1,20}=importdata('000063.csv');
stock{1,21}=importdata('000065.csv');
stock{1,22}=importdata('000069.csv');
stock{1,23}=importdata('000078.csv');
stock{1,24}=importdata('000088.csv');
stock{1,25}=importdata('000089.csv');
stock{1,26}=importdata('000090.csv');
stock{1,27}=importdata('000096.csv');
stock{1,28}=importdata('000402.csv');
stock{1,29}=importdata('000404.csv');
stock{1,30}=importdata('000410.csv');
stock{1,31}=importdata('000417.csv');
stock{1,32}=importdata('000418.csv');
stock{1,33}=importdata('000419.csv');
stock{1,34}=importdata('000420.csv');
stock{1,35}=importdata('000421.csv');
stock{1,36}=importdata('000422.csv');
stock{1,37}=importdata('000423.csv');
stock{1,38}=importdata('000425.csv');
stock{1,39}=importdata('000428.csv');
stock{1,40}=importdata('000501.csv');
stock{1,41}=importdata('000507.csv');
stock{1,42}=importdata('000510.csv');
stock{1,43}=importdata('000514.csv');
stock{1,44}=importdata('000521.csv');
stock{1,45}=importdata('000523.csv');
stock{1,46}=importdata('000525.csv');
stock{1,47}=importdata('000528.csv');
stock{1,48}=importdata('000530.csv');
stock{1,49}=importdata('000531.csv');
stock{1,50}=importdata('000532.csv');
stock{1,51}=importdata('000538.csv');
stock{1,52}=importdata('000539.csv');
stock{1,53}=importdata('000541.csv');
stock{1,54}=importdata('000543.csv');
stock{1,55}=importdata('000544.csv');
stock{1,56}=importdata('000548.csv');
stock{1,57}=importdata('000550.csv');
stock{1,58}=importdata('000551.csv');
stock{1,59}=importdata('000554.csv');
stock{1,60}=importdata('000559.csv');
stock{1,61}=importdata('000563.csv');
stock{1,62}=importdata('000565.csv');
stock{1,63}=importdata('000567.csv');
stock{1,64}=importdata('000568.csv');
stock{1,65}=importdata('000570.csv');
stock{1,66}=importdata('000572.csv');
stock{1,67}=importdata('000573.csv');
stock{1,68}=importdata('000576.csv');
stock{1,69}=importdata('000581.csv');
stock{1,70}=importdata('000589.csv');
stock{1,71}=importdata('000591.csv');
stock{1,72}=importdata('000597.csv');
stock{1,73}=importdata('000598.csv');
stock{1,74}=importdata('000599.csv');
stock{1,75}=importdata('000601.csv');
stock{1,76}=importdata('000609.csv');
stock{1,77}=importdata('000610.csv');
stock{1,78}=importdata('000619.csv');
stock{1,79}=importdata('000623.csv');
stock{1,80}=importdata('000627.csv');
stock{1,81}=importdata('000632.csv');
stock{1,82}=importdata('000635.csv');
stock{1,83}=importdata('000637.csv');
stock{1,84}=importdata('000659.csv');
stock{1,85}=importdata('000661.csv');
stock{1,86}=importdata('000667.csv');
stock{1,87}=importdata('000680.csv');
stock{1,88}=importdata('000685.csv');
stock{1,89}=importdata('000690.csv');
stock{1,90}=importdata('000692.csv');
stock{1,91}=importdata('000698.csv');
stock{1,92}=importdata('000700.csv');
stock{1,93}=importdata('000701.csv');
stock{1,94}=importdata('000702.csv');
stock{1,95}=importdata('000703.csv');
stock{1,96}=importdata('000705.csv');
stock{1,97}=importdata('000707.csv');
stock{1,98}=importdata('000708.csv');
stock{1,99}=importdata('000713.csv');
stock{1,100}=importdata('000717.csv');
pear = ones(100);
spear = ones(100);
a = 1;
for q = 1:99
    for p = q+1:100
        price1 = [];
        price11 = [];
        price2 = [];
        price22 = [];
        t=1;
        C = {};
        id1 =[];
        id2 =[];
        [C,id1,id2] = intersect(stock{1,q}.textdata(:,1),stock{1,p}.textdata(:,1));
        id11 = id1'; %列变行
        id22 = id2';
        for i = 1:length(id11)-1
            price1(t)=(stock{1,q}.data(id11(i)-1,3)+stock{1,q}.data(id11(i)-1,4))/2;
            price2(t)=(stock{1,p}.data(id22(i)-1,3)+stock{1,p}.data(id22(i)-1,4))/2;
            t = t+1;
        end
            price11 =price1'; %列变行
            price22 =price2';
            P=corr(price11,price22,'type','pearson');
            S=corr(price11,price22,'type','Spearman');
            fprintf('%g  %g\n',P,S);
            pear(q,p)=P;
            pear(p,q)=P;
            spear(q,p)=S;
            spear(p,q)=S;
        end
    end
        csvwrite('pearson系数.csv',pear);
        csvwrite('Spearman系数.csv',spear);
        
end

