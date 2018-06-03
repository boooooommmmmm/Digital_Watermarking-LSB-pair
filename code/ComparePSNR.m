%=========================================================================
%============This function is for comaring PSNR difference================
%=========================================================================

function [PSNR_header_Sheet1, PSNR_result_List, PSNR_header_Sheet2, PSNR_compare_result_List] = ComparePSNR(PSNR_List, PSNR_pair_List, PSNR_pair_dual_List, PSNR_pair_triple_List,PSNR_pair_ultra_List,PSNR_pair_diagonal_List,PSNR_pair_crossDoubleLine_List)


PSNR_pair_List_PSNR_List_compare = zeros(3, 1);
PSNR_pair_dual_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_dual_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_pair_dual_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre = zeros(3, 1);
%--------------Two New Functions----------------------
PSNR_pair_diagonal_List_PSNR_List_compare = zeros(3, 1);
PSNR_pair_crossDoubleLine_List_PSNR_List_compare = zeros(3, 1);

PSNR_pair_List_PSNR_List = PSNR_pair_List-PSNR_List;
PSNR_pair_dual_List_PSNR_List = PSNR_pair_dual_List-PSNR_List;
PSNR_pair_triple_List_PSNR_List = PSNR_pair_triple_List-PSNR_List;
PSNR_pair_ultra_List_PSNR_List = PSNR_pair_ultra_List-PSNR_List;
PSNR_pair_dual_List_PSNR_pair_List = PSNR_pair_dual_List-PSNR_pair_List;
PSNR_pair_triple_List_PSNR_pair_List = PSNR_pair_triple_List-PSNR_pair_List;
PSNR_pair_ultra_List_PSNR_pair_List = PSNR_pair_ultra_List-PSNR_pair_List;
PSNR_pair_triple_List_PSNR_pair_dual_List = PSNR_pair_triple_List-PSNR_pair_dual_List;
PSNR_pair_ultra_List_PSNR_pair_dual_List = PSNR_pair_ultra_List-PSNR_pair_dual_List;
PSNR_pair_ultra_List_PSNR_pair_triple_List = PSNR_pair_ultra_List-PSNR_pair_triple_List;
%--------------Two New Functions----------------------
PSNR_pair_diagonal_List_PSNR_List = PSNR_pair_diagonal_List - PSNR_List;
PSNR_pair_crossDoubleLine_List_PSNR_List = PSNR_pair_crossDoubleLine_List - PSNR_List;


% Count performance 1
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_List_PSNR_List)
    if PSNR_pair_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_List_PSNR_List_compare(1) = n1;
PSNR_pair_List_PSNR_List_compare(2) = n2;
PSNR_pair_List_PSNR_List_compare(3) = n3;

%2
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_dual_List_PSNR_List)
    if PSNR_pair_dual_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_dual_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_dual_List_PSNR_List_comapre(1) = n1;
PSNR_pair_dual_List_PSNR_List_comapre(2) = n2;
PSNR_pair_dual_List_PSNR_List_comapre(3) = n3;

%3
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_triple_List_PSNR_List)
    if PSNR_pair_triple_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_triple_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_triple_List_PSNR_List_comapre(1) = n1;
PSNR_pair_triple_List_PSNR_List_comapre(2) = n2;
PSNR_pair_triple_List_PSNR_List_comapre(3) = n3;

%4
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_ultra_List_PSNR_List)
    if PSNR_pair_ultra_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_ultra_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_ultra_List_PSNR_List_comapre(1) = n1;
PSNR_pair_ultra_List_PSNR_List_comapre(2) = n2;
PSNR_pair_ultra_List_PSNR_List_comapre(3) = n3;

%5
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_dual_List_PSNR_pair_List)
    if PSNR_pair_dual_List_PSNR_pair_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_dual_List_PSNR_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_dual_List_PSNR_pair_List_comapre(1) = n1;
PSNR_pair_dual_List_PSNR_pair_List_comapre(2) = n2;
PSNR_pair_dual_List_PSNR_pair_List_comapre(3) = n3;

%6
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_triple_List_PSNR_pair_List)
    if PSNR_pair_triple_List_PSNR_pair_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_triple_List_PSNR_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_triple_List_PSNR_pair_List_comapre(1) = n1;
PSNR_pair_triple_List_PSNR_pair_List_comapre(2) = n2;
PSNR_pair_triple_List_PSNR_pair_List_comapre(3) = n3;

%7
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_ultra_List_PSNR_pair_List)
    if PSNR_pair_ultra_List_PSNR_pair_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_ultra_List_PSNR_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_ultra_List_PSNR_pair_List_comapre(1) = n1;
PSNR_pair_ultra_List_PSNR_pair_List_comapre(2) = n2;
PSNR_pair_ultra_List_PSNR_pair_List_comapre(3) = n3;

%8
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_triple_List_PSNR_pair_dual_List)
    if PSNR_pair_triple_List_PSNR_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_triple_List_PSNR_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_triple_List_PSNR_pair_dual_List_comapre(1) = n1;
PSNR_pair_triple_List_PSNR_pair_dual_List_comapre(2) = n2;
PSNR_pair_triple_List_PSNR_pair_dual_List_comapre(3) = n3;

%9
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_ultra_List_PSNR_pair_dual_List)
    if PSNR_pair_ultra_List_PSNR_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_ultra_List_PSNR_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre(1) = n1;
PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre(2) = n2;
PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre(3) = n3;

%10
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_ultra_List_PSNR_pair_triple_List)
    if PSNR_pair_ultra_List_PSNR_pair_triple_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_ultra_List_PSNR_pair_triple_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre(1) = n1;
PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre(2) = n2;
PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre(3) = n3;


%11
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_diagonal_List_PSNR_List)
    if PSNR_pair_diagonal_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_diagonal_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_diagonal_List_PSNR_List_compare(1) = n1;
PSNR_pair_diagonal_List_PSNR_List_compare(2) = n2;
PSNR_pair_diagonal_List_PSNR_List_compare(3) = n3;


%12
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(PSNR_pair_crossDoubleLine_List_PSNR_List)
    if PSNR_pair_crossDoubleLine_List_PSNR_List(i) == 0
        n1 = n1 + 1;
    elseif PSNR_pair_crossDoubleLine_List_PSNR_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
PSNR_pair_crossDoubleLine_List_PSNR_List_compare(1) = n1;
PSNR_pair_crossDoubleLine_List_PSNR_List_compare(2) = n2;
PSNR_pair_crossDoubleLine_List_PSNR_List_compare(3) = n3;


PSNR_header_Sheet1 = {'Image Name', 'LSB',     'LSB_pair',     'LSB_pair_dual',     'LSB_pair_triple',     'LSB_pair_ultra',     'LSB_pair_diagonal',     'LSB_pair_crossDoubleLine'    'LSB_pair - LSB',         'LSB_pair_dual - LSB',        ' LSB_pair_triple - LSB',         'LSB_pair_ultra - LSB',         'LSB_pair_dual - LSB_pair',         'LSB_pair_triple - LSB_pair',         'LSB_pair_ultra - LSB_pair',         'LSB_pair_triple - LSB_pair_dual',         'LSB_pair_ultra - LSB_pair_dual',         'LSB_pair_ultra - LSB_pair_triple',         'PSNR_pair_diagonal - LSB',        'PSNR_pair_crossDoubleLine - LSB'};
PSNR_result_List = [                 PSNR_List, PSNR_pair_List, PSNR_pair_dual_List, PSNR_pair_triple_List, PSNR_pair_ultra_List, PSNR_pair_diagonal_List, PSNR_pair_crossDoubleLine_List, PSNR_pair_List_PSNR_List, PSNR_pair_dual_List_PSNR_List, PSNR_pair_triple_List_PSNR_List, PSNR_pair_ultra_List_PSNR_List, PSNR_pair_dual_List_PSNR_pair_List, PSNR_pair_triple_List_PSNR_pair_List, PSNR_pair_ultra_List_PSNR_pair_List, PSNR_pair_triple_List_PSNR_pair_dual_List, PSNR_pair_ultra_List_PSNR_pair_dual_List, PSNR_pair_ultra_List_PSNR_pair_triple_List, PSNR_pair_diagonal_List_PSNR_List, PSNR_pair_crossDoubleLine_List_PSNR_List];
PSNR_header_Sheet2 = {     'PSNR_pair_List_PSNR_List_compare',  'PSNR_pair_dual_List_PSNR_List_comapre', 'PSNR_pair_triple_List_PSNR_List_comapre', 'PSNR_pair_ultra_List_PSNR_List_comapre', 'PSNR_pair_dual_List_PSNR_pair_List_comapre', 'PSNR_pair_triple_List_PSNR_pair_List_comapre', 'PSNR_pair_ultra_List_PSNR_pair_List_comapre', 'PSNR_pair_triple_List_PSNR_pair_dual_List_comapre', 'PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre', 'PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre', 'PSNR_pair_diagonal_List_PSNR_List_compare', 'PSNR_pair_crossDoubleLine_List_PSNR_List_compare'};
PSNR_compare_result_List = [PSNR_pair_List_PSNR_List_compare,    PSNR_pair_dual_List_PSNR_List_comapre,   PSNR_pair_triple_List_PSNR_List_comapre,   PSNR_pair_ultra_List_PSNR_List_comapre,   PSNR_pair_dual_List_PSNR_pair_List_comapre,   PSNR_pair_triple_List_PSNR_pair_List_comapre,   PSNR_pair_ultra_List_PSNR_pair_List_comapre,   PSNR_pair_triple_List_PSNR_pair_dual_List_comapre,   PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre,   PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre,   PSNR_pair_diagonal_List_PSNR_List_compare,   PSNR_pair_crossDoubleLine_List_PSNR_List_compare];


%---END