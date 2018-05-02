function [Hae_header_Sheet1, Hae_result_List, Hae_header_Sheet2, Hae_compare_result_List] = CompareHae(Hae_List, Hae_pair_List, Hae_pair_dual_List, Hae_pair_triple_List,Hae_pair_ultra_List)

Hae_pair_List_Hae_List_compare = zeros(3, 1);
Hae_pair_dual_List_Hae_List_comapre = zeros(3, 1);
Hae_pair_triple_List_Hae_List_comapre = zeros(3, 1);
Hae_pair_ultra_List_Hae_List_comapre = zeros(3, 1);
Hae_pair_dual_List_Hae_pair_List_comapre = zeros(3, 1);
Hae_pair_triple_List_Hae_pair_List_comapre = zeros(3, 1);
Hae_pair_ultra_List_Hae_pair_List_comapre = zeros(3, 1);
Hae_pair_triple_List_Hae_pair_dual_List_comapre = zeros(3, 1);
Hae_pair_ultra_List_Hae_pair_dual_List_comapre = zeros(3, 1);
Hae_pair_ultra_List_Hae_pair_triple_List_comapre = zeros(3, 1);


Hae_pair_List_Hae_List = Hae_pair_List-Hae_List;
Hae_pair_dual_List_Hae_List = Hae_pair_dual_List-Hae_List;
Hae_pair_triple_List_Hae_List = Hae_pair_triple_List-Hae_List;
Hae_pair_ultra_List_Hae_List = Hae_pair_ultra_List-Hae_List;
Hae_pair_dual_List_Hae_pair_List = Hae_pair_dual_List-Hae_pair_List;
Hae_pair_triple_List_Hae_pair_List = Hae_pair_triple_List-Hae_pair_List;
Hae_pair_ultra_List_Hae_pair_List = Hae_pair_ultra_List-Hae_pair_List;
Hae_pair_triple_List_Hae_pair_dual_List = Hae_pair_triple_List-Hae_pair_dual_List;
Hae_pair_ultra_List_Hae_pair_dual_List = Hae_pair_ultra_List-Hae_pair_dual_List;
Hae_pair_ultra_List_Hae_pair_triple_List = Hae_pair_ultra_List-Hae_pair_triple_List;



% Count performance 1
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_List_Hae_List)
    if Hae_pair_List_Hae_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_List_Hae_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_List_Hae_List_compare(1) = n1;
Hae_pair_List_Hae_List_compare(2) = n2;
Hae_pair_List_Hae_List_compare(3) = n3;

%2
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_dual_List_Hae_List)
    if Hae_pair_dual_List_Hae_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_dual_List_Hae_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_dual_List_Hae_List_comapre(1) = n1;
Hae_pair_dual_List_Hae_List_comapre(2) = n2;
Hae_pair_dual_List_Hae_List_comapre(3) = n3;

%3
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_triple_List_Hae_List)
    if Hae_pair_triple_List_Hae_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_triple_List_Hae_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_triple_List_Hae_List_comapre(1) = n1;
Hae_pair_triple_List_Hae_List_comapre(2) = n2;
Hae_pair_triple_List_Hae_List_comapre(3) = n3;

%4
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_ultra_List_Hae_List)
    if Hae_pair_ultra_List_Hae_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_ultra_List_Hae_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_ultra_List_Hae_List_comapre(1) = n1;
Hae_pair_ultra_List_Hae_List_comapre(2) = n2;
Hae_pair_ultra_List_Hae_List_comapre(3) = n3;

%5
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_dual_List_Hae_pair_List)
    if Hae_pair_dual_List_Hae_pair_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_dual_List_Hae_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_dual_List_Hae_pair_List_comapre(1) = n1;
Hae_pair_dual_List_Hae_pair_List_comapre(2) = n2;
Hae_pair_dual_List_Hae_pair_List_comapre(3) = n3;

%6
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_triple_List_Hae_pair_List)
    if Hae_pair_triple_List_Hae_pair_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_triple_List_Hae_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_triple_List_Hae_pair_List_comapre(1) = n1;
Hae_pair_triple_List_Hae_pair_List_comapre(2) = n2;
Hae_pair_triple_List_Hae_pair_List_comapre(3) = n3;

%7
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_ultra_List_Hae_pair_List)
    if Hae_pair_ultra_List_Hae_pair_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_ultra_List_Hae_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_ultra_List_Hae_pair_List_comapre(1) = n1;
Hae_pair_ultra_List_Hae_pair_List_comapre(2) = n2;
Hae_pair_ultra_List_Hae_pair_List_comapre(3) = n3;

%8
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_triple_List_Hae_pair_dual_List)
    if Hae_pair_triple_List_Hae_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_triple_List_Hae_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_triple_List_Hae_pair_dual_List_comapre(1) = n1;
Hae_pair_triple_List_Hae_pair_dual_List_comapre(2) = n2;
Hae_pair_triple_List_Hae_pair_dual_List_comapre(3) = n3;

%9
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_ultra_List_Hae_pair_dual_List)
    if Hae_pair_ultra_List_Hae_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_ultra_List_Hae_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_ultra_List_Hae_pair_dual_List_comapre(1) = n1;
Hae_pair_ultra_List_Hae_pair_dual_List_comapre(2) = n2;
Hae_pair_ultra_List_Hae_pair_dual_List_comapre(3) = n3;

%10
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(Hae_pair_ultra_List_Hae_pair_triple_List)
    if Hae_pair_ultra_List_Hae_pair_triple_List(i) == 0
        n1 = n1 + 1;
    elseif Hae_pair_ultra_List_Hae_pair_triple_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
Hae_pair_ultra_List_Hae_pair_triple_List_comapre(1) = n1;
Hae_pair_ultra_List_Hae_pair_triple_List_comapre(2) = n2;
Hae_pair_ultra_List_Hae_pair_triple_List_comapre(3) = n3;


Hae_header_Sheet1 = {'Image Name', 'LSB',     'LSB_pair',     'LSB_pair_dual',     'LSB_pair_triple',     'LSB_pair_ultra',     'LSB_pair - LSB',         'LSB_pair_dual - LSB',        ' LSB_pair_triple - LSB',         'LSB_pair_ultra - LSB',         'LSB_pair_dual - LSB_pair',         'LSB_pair_triple - LSB_pair',         'LSB_pair_ultra - LSB_pair',         'LSB_pair_triple - LSB_pair_dual',         'LSB_pair_ultra - LSB_pair_dual',         'LSB_pair_ultra - LSB_pair_triple'};
Hae_result_List = [                 Hae_List, Hae_pair_List, Hae_pair_dual_List, Hae_pair_triple_List, Hae_pair_ultra_List, Hae_pair_List_Hae_List, Hae_pair_dual_List_Hae_List, Hae_pair_triple_List_Hae_List, Hae_pair_ultra_List_Hae_List, Hae_pair_dual_List_Hae_pair_List, Hae_pair_triple_List_Hae_pair_List, Hae_pair_ultra_List_Hae_pair_List, Hae_pair_triple_List_Hae_pair_dual_List, Hae_pair_ultra_List_Hae_pair_dual_List, Hae_pair_ultra_List_Hae_pair_triple_List];
Hae_header_Sheet2 = {     'Hae_pair_List_Hae_List_compare',  'Hae_pair_dual_List_Hae_List_comapre', 'Hae_pair_triple_List_Hae_List_comapre', 'Hae_pair_ultra_List_Hae_List_comapre', 'Hae_pair_dual_List_Hae_pair_List_comapre', 'Hae_pair_triple_List_Hae_pair_List_comapre', 'Hae_pair_ultra_List_Hae_pair_List_comapre', 'Hae_pair_triple_List_Hae_pair_dual_List_comapre', 'Hae_pair_ultra_List_Hae_pair_dual_List_comapre', 'Hae_pair_ultra_List_Hae_pair_triple_List_comapre'};
Hae_compare_result_List = [Hae_pair_List_Hae_List_compare,    Hae_pair_dual_List_Hae_List_comapre,   Hae_pair_triple_List_Hae_List_comapre,   Hae_pair_ultra_List_Hae_List_comapre,   Hae_pair_dual_List_Hae_pair_List_comapre,   Hae_pair_triple_List_Hae_pair_List_comapre,   Hae_pair_ultra_List_Hae_pair_List_comapre,   Hae_pair_triple_List_Hae_pair_dual_List_comapre,   Hae_pair_ultra_List_Hae_pair_dual_List_comapre,   Hae_pair_ultra_List_Hae_pair_triple_List_comapre];


%---END