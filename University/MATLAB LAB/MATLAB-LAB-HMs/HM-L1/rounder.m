function [ roundedGrade ] = rounder( Grade )
% Rounding students' grade with a custom rule which teachers' said.
        
    if Grade < 5
        roundedGrade = 9;
    elseif (5 <= Grade) && (Grade < 8)
        roundedGrade = 9.9;
    elseif (8 <= Grade) && (Grade < 10)
        roundedGrade = 10;
    elseif (10 <= Grade) && (Grade < 15)
        roundedGrade = grade + 1;
    elseif (15 <= Grade) && (Grade < 19.5)
        roundedGrade = Grade + 0.5;
    else
        roundedGrade = 20;
    end
end

