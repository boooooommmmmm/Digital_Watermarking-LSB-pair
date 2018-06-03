%=========================================================================
%============This function is for comaring SSIM difference================
%=========================================================================

function [SSIM_header_Sheet1, SSIM_result_List, SSIM_header_Sheet2, SSIM_compare_result_List] = CompareSSIM(SSIM_List, SSIM_pair_List, SSIM_pair_dual_List, SSIM_pair_triple_List,SSIM_pair_ultra_List, SSIM_pair_diagonal_List, SSIM_pair_crossDoubleLine_List)

SSIM_pair_List_SSIM_List_compare = zeros(3, 1);
SSIM_pair_dual_List_SSIM_List_comapre = zeros(3, 1);
SSIM_pair_triple_List_SSIM_List_comapre = zeros(3, 1);
SSIM_pair_ultra_List_SSIM_List_comapre = zeros(3, 1);
SSIM_pair_dual_List_SSIM_pair_List_comapre = zeros(3, 1);
SSIM_pair_triple_List_SSIM_pair_List_comapre = zeros(3, 1);
SSIM_pair_ultra_List_SSIM_pair_List_comapre = zeros(3, 1);
SSIM_pair_triple_List_SSIM_pair_dual_List_comapre = zeros(3, 1);
SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre = zeros(3, 1);
SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre = zeros(3, 1);
%--------------Two New Functions----------------------
SSIM_pair_diagonal_List_SSIM_List_compare = zeros(3, 1);
SSIM_pair_diagonal_List_SSIM_pair_List_compare = zeros(3, 1);
SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare = zeros(3, 1);
SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare = zeros(3, 1);
SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare = zeros(3, 1);
SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare = zeros(3, 1);
SSIM_pair_crossDoubleLine_List_SSIM_List_compare = zeros(3, 1);
SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare = zeros(3, 1);
SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare = zeros(3, 1);
SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare = zeros(3, 1);
SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare = zeros(3, 1);


SSIM_pair_List_SSIM_List = SSIM_pair_List-SSIM_List;
SSIM_pair_dual_List_SSIM_List = SSIM_pair_dual_List-SSIM_List;
SSIM_pair_triple_List_SSIM_List = SSIM_pair_triple_List-SSIM_List;
SSIM_pair_ultra_List_SSIM_List = SSIM_pair_ultra_List-SSIM_List;
SSIM_pair_dual_List_SSIM_pair_List = SSIM_pair_dual_List-SSIM_pair_List;
SSIM_pair_triple_List_SSIM_pair_List = SSIM_pair_triple_List-SSIM_pair_List;
SSIM_pair_ultra_List_SSIM_pair_List = SSIM_pair_ultra_List-SSIM_pair_List;
SSIM_pair_triple_List_SSIM_pair_dual_List = SSIM_pair_triple_List-SSIM_pair_dual_List;
SSIM_pair_ultra_List_SSIM_pair_dual_List = SSIM_pair_ultra_List-SSIM_pair_dual_List;
SSIM_pair_ultra_List_SSIM_pair_triple_List = SSIM_pair_ultra_List-SSIM_pair_triple_List;
%--------------Two New Functions----------------------
SSIM_pair_diagonal_List_SSIM_List = SSIM_pair_diagonal_List-SSIM_List;
SSIM_pair_diagonal_List_SSIM_pair_List = SSIM_pair_diagonal_List-SSIM_pair_List;
SSIM_pair_diagonal_List_SSIM_pair_dual_List = SSIM_pair_diagonal_List-SSIM_pair_dual_List;
SSIM_pair_diagonal_List_SSIM_pair_triple_List = SSIM_pair_diagonal_List-SSIM_pair_triple_List;
SSIM_pair_diagonal_List_SSIM_pair_ultra_List = SSIM_pair_diagonal_List-SSIM_pair_ultra_List;
SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List = SSIM_pair_diagonal_List-SSIM_pair_crossDoubleLine_List;
SSIM_pair_crossDoubleLine_List_SSIM_List = SSIM_pair_crossDoubleLine_List-SSIM_List;
SSIM_pair_crossDoubleLine_List_SSIM_pair_List = SSIM_pair_crossDoubleLine_List-SSIM_pair_List;
SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List = SSIM_pair_crossDoubleLine_List-SSIM_pair_dual_List;
SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List = SSIM_pair_crossDoubleLine_List-SSIM_pair_triple_List;
SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List = SSIM_pair_crossDoubleLine_List-SSIM_pair_ultra_List;


% Count performance 1
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_List_SSIM_List)
    if SSIM_pair_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_List_SSIM_List_compare(1) = n1;
SSIM_pair_List_SSIM_List_compare(2) = n2;
SSIM_pair_List_SSIM_List_compare(3) = n3;

%2
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_dual_List_SSIM_List)
    if SSIM_pair_dual_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_dual_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_dual_List_SSIM_List_comapre(1) = n1;
SSIM_pair_dual_List_SSIM_List_comapre(2) = n2;
SSIM_pair_dual_List_SSIM_List_comapre(3) = n3;

%3
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_triple_List_SSIM_List)
    if SSIM_pair_triple_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_triple_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_triple_List_SSIM_List_comapre(1) = n1;
SSIM_pair_triple_List_SSIM_List_comapre(2) = n2;
SSIM_pair_triple_List_SSIM_List_comapre(3) = n3;

%4
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_ultra_List_SSIM_List)
    if SSIM_pair_ultra_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_ultra_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_ultra_List_SSIM_List_comapre(1) = n1;
SSIM_pair_ultra_List_SSIM_List_comapre(2) = n2;
SSIM_pair_ultra_List_SSIM_List_comapre(3) = n3;

%5
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_dual_List_SSIM_pair_List)
    if SSIM_pair_dual_List_SSIM_pair_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_dual_List_SSIM_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_dual_List_SSIM_pair_List_comapre(1) = n1;
SSIM_pair_dual_List_SSIM_pair_List_comapre(2) = n2;
SSIM_pair_dual_List_SSIM_pair_List_comapre(3) = n3;

%6
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_triple_List_SSIM_pair_List)
    if SSIM_pair_triple_List_SSIM_pair_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_triple_List_SSIM_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_triple_List_SSIM_pair_List_comapre(1) = n1;
SSIM_pair_triple_List_SSIM_pair_List_comapre(2) = n2;
SSIM_pair_triple_List_SSIM_pair_List_comapre(3) = n3;

%7
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_ultra_List_SSIM_pair_List)
    if SSIM_pair_ultra_List_SSIM_pair_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_ultra_List_SSIM_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_ultra_List_SSIM_pair_List_comapre(1) = n1;
SSIM_pair_ultra_List_SSIM_pair_List_comapre(2) = n2;
SSIM_pair_ultra_List_SSIM_pair_List_comapre(3) = n3;

%8
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_triple_List_SSIM_pair_dual_List)
    if SSIM_pair_triple_List_SSIM_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_triple_List_SSIM_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_triple_List_SSIM_pair_dual_List_comapre(1) = n1;
SSIM_pair_triple_List_SSIM_pair_dual_List_comapre(2) = n2;
SSIM_pair_triple_List_SSIM_pair_dual_List_comapre(3) = n3;

%9
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_ultra_List_SSIM_pair_dual_List)
    if SSIM_pair_ultra_List_SSIM_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_ultra_List_SSIM_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre(1) = n1;
SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre(2) = n2;
SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre(3) = n3;

%10
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_ultra_List_SSIM_pair_triple_List)
    if SSIM_pair_ultra_List_SSIM_pair_triple_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_ultra_List_SSIM_pair_triple_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre(1) = n1;
SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre(2) = n2;
SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre(3) = n3;


%---------------------------Two New Functions
%11
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_List)
    if SSIM_pair_diagonal_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_List_compare(3) = n3;

%12
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_pair_List)
    if SSIM_pair_diagonal_List_SSIM_pair_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_pair_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_pair_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_pair_List_compare(3) = n3;

%13
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_pair_dual_List)
    if SSIM_pair_diagonal_List_SSIM_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare(3) = n3;

%14
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_pair_triple_List)
    if SSIM_pair_diagonal_List_SSIM_pair_triple_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_pair_triple_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare(3) = n3;

%15
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_pair_ultra_List)
    if SSIM_pair_diagonal_List_SSIM_pair_ultra_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_pair_ultra_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare(3) = n3;

%16
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List)
    if SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare(1) = n1;
SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare(2) = n2;
SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare(3) = n3;

%17
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_crossDoubleLine_List_SSIM_List)
    if SSIM_pair_crossDoubleLine_List_SSIM_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_crossDoubleLine_List_SSIM_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_crossDoubleLine_List_SSIM_List_compare(1) = n1;
SSIM_pair_crossDoubleLine_List_SSIM_List_compare(2) = n2;
SSIM_pair_crossDoubleLine_List_SSIM_List_compare(3) = n3;

%18
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_crossDoubleLine_List_SSIM_pair_List)
    if SSIM_pair_crossDoubleLine_List_SSIM_pair_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_crossDoubleLine_List_SSIM_pair_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare(1) = n1;
SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare(2) = n2;
SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare(3) = n3;

%19
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List)
    if SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare(1) = n1;
SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare(2) = n2;
SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare(3) = n3;

%20
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List)
    if SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare(1) = n1;
SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare(2) = n2;
SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare(3) = n3;

%21
n1 = 0;
n2 = 0;
n3 = 0;
for i = 1: size(SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List)
    if SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List(i) == 0
        n1 = n1 + 1;
    elseif SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List(i) > 0
        n2 = n2 + 1;
    else
        n3 = n3 + 1;
    end
end
SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare(1) = n1;
SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare(2) = n2;
SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare(3) = n3;




SSIM_header_Sheet1 = {'Image Name', 'LSB',    'LSB_pair',    'LSB_pair_dual',    'LSB_pair_triple',    'LSB_pair_ultra',    'SSIM_pair_diagonal_List', 'SSIM_pair_crossDoubleLine_List',   'LSB_pair - LSB',       'LSB_pair_dual - LSB',      ' LSB_pair_triple - LSB',       'LSB_pair_ultra - LSB',       'LSB_pair_dual - LSB_pair',       'LSB_pair_triple - LSB_pair',       'LSB_pair_ultra - LSB_pair',       'LSB_pair_triple - LSB_pair_dual',       'LSB_pair_ultra - LSB_pair_dual',       'LSB_pair_ultra - LSB_pair_triple',       'SSIM_pair_diagonal_List - LSB',  'SSIM_pair_diagonal_List - SSIM_pair_List', 'SSIM_pair_diagonal_List - SSIM_pair_dual_List', 'SSIM_pair_diagonal_List - SSIM_pair_triple_List', 'SSIM_pair_diagonal_List - SSIM_pair_ultra_List', 'SSIM_pair_diagonal_List - SSIM_pair_crossDoubleLine_List', 'SSIM_pair_crossDoubleLine - List_SSIM_List', 'SSIM_pair_crossDoubleLine_List - SSIM_pair_List', 'SSIM_pair_crossDoubleLine_List - SSIM_pair_dual_List', 'SSIM_pair_crossDoubleLine_List - SSIM_pair_triple_List', 'SSIM_pair_crossDoubleLine_List - SSIM_pair_ultra_List'};
SSIM_result_List = [                 SSIM_List, SSIM_pair_List, SSIM_pair_dual_List, SSIM_pair_triple_List, SSIM_pair_ultra_List, SSIM_pair_diagonal_List,   SSIM_pair_crossDoubleLine_List,     SSIM_pair_List_SSIM_List, SSIM_pair_dual_List_SSIM_List, SSIM_pair_triple_List_SSIM_List, SSIM_pair_ultra_List_SSIM_List, SSIM_pair_dual_List_SSIM_pair_List, SSIM_pair_triple_List_SSIM_pair_List, SSIM_pair_ultra_List_SSIM_pair_List, SSIM_pair_triple_List_SSIM_pair_dual_List, SSIM_pair_ultra_List_SSIM_pair_dual_List, SSIM_pair_ultra_List_SSIM_pair_triple_List, SSIM_pair_diagonal_List_SSIM_List, SSIM_pair_diagonal_List_SSIM_pair_List,     SSIM_pair_diagonal_List_SSIM_pair_dual_List,     SSIM_pair_diagonal_List_SSIM_pair_triple_List,     SSIM_pair_diagonal_List_SSIM_pair_ultra_List,     SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List,     SSIM_pair_crossDoubleLine_List_SSIM_List,     SSIM_pair_crossDoubleLine_List_SSIM_pair_List,     SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List,     SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List ,    SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List];
SSIM_header_Sheet2 = {     'SSIM_pair_List_SSIM_List_compare',  'SSIM_pair_dual_List_SSIM_List_comapre', 'SSIM_pair_triple_List_SSIM_List_comapre', 'SSIM_pair_ultra_List_SSIM_List_comapre', 'SSIM_pair_dual_List_SSIM_pair_List_comapre', 'SSIM_pair_triple_List_SSIM_pair_List_comapre', 'SSIM_pair_ultra_List_SSIM_pair_List_comapre', 'SSIM_pair_triple_List_SSIM_pair_dual_List_comapre', 'SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre', 'SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre', 'SSIM_pair_diagonal_List_SSIM_List_compare', 'SSIM_pair_diagonal_List_SSIM_pair_List_compare', 'SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare', 'SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare', 'SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare', 'SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare', 'SSIM_pair_crossDoubleLine_List_SSIM_List_compare', 'SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare', 'SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare', 'SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare', 'SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare'};
SSIM_compare_result_List = [SSIM_pair_List_SSIM_List_compare,    SSIM_pair_dual_List_SSIM_List_comapre,   SSIM_pair_triple_List_SSIM_List_comapre,   SSIM_pair_ultra_List_SSIM_List_comapre,   SSIM_pair_dual_List_SSIM_pair_List_comapre,   SSIM_pair_triple_List_SSIM_pair_List_comapre,   SSIM_pair_ultra_List_SSIM_pair_List_comapre,   SSIM_pair_triple_List_SSIM_pair_dual_List_comapre,   SSIM_pair_ultra_List_SSIM_pair_dual_List_comapre,   SSIM_pair_ultra_List_SSIM_pair_triple_List_comapre,   SSIM_pair_diagonal_List_SSIM_List_compare,   SSIM_pair_diagonal_List_SSIM_pair_List_compare,   SSIM_pair_diagonal_List_SSIM_pair_dual_List_compare,   SSIM_pair_diagonal_List_SSIM_pair_triple_List_compare,   SSIM_pair_diagonal_List_SSIM_pair_ultra_List_compare,   SSIM_pair_diagonal_List_SSIM_pair_crossDoubleLine_List_compare,   SSIM_pair_crossDoubleLine_List_SSIM_List_compare,   SSIM_pair_crossDoubleLine_List_SSIM_pair_List_compare,   SSIM_pair_crossDoubleLine_List_SSIM_pair_dual_List_compare,   SSIM_pair_crossDoubleLine_List_SSIM_pair_triple_List_compare,   SSIM_pair_crossDoubleLine_List_SSIM_pair_ultra_List_compare];

%---END