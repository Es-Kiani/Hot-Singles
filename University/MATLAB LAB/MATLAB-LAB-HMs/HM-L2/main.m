fprintf('This MATLAB script now is work with my last semester data.\nSo if you want to use it with your custom data,\nyou should edit the script and change two\nvariable names which marked with a .m comment that\nhave TODO at the biginning.\nI hope you enjoy it.. :)\n');
% tmpNAme = input('Enter your nx2 semester information matrix as a format of:\n[@, @\n ., .\n ., .\n @, @]\n |  |\n |  *->	Units\n |\n *----> Grades\n:');
% TODO: Uncomment pervious line (Line 2)
% TODO: change it name to {info}

result = zeros(3, 1);
%  [ Total units count
%    Mean (average) of scores
%    Student status  ]

info = [19.5, 3;
            17.5, 3;
            17.5, 3;
            20  , 3;
            20  , 3;
            20  , 2;
            20  , 3]; %TODO: change name to {testData}

mSize = size(info);

for i=1:mSize(1)
    result(1, 1) = result(1, 1) + info(i, 2);
    result(2, 1) = result(2, 1) + (info(i, 1) .* info(i, 2));
end

result(2, 1) = round(result(2, 1) ./ result(1, 1), 2);

if result(2, 1) < 10
    result(3, 1) = 0;
elseif ((result(2, 1) >= 10) && (result(2, 1) < 14))
    result(3, 1) = 1;
elseif ((result(2, 1) >= 14) && (result(2, 1) < 17))
    result(3, 1) = 2;
elseif ((result(2, 1) >= 17) && (result(2, 1) <= 20))
    result(3, 1) = 3;
end

% Student status codes:
%       0: Semester fail (Mean under 10)
%       1: Mashrout      (Mean in [10-14])
%       2: Normal        (Mean in [14-17])
%       3: Top           (Mean in [17-20])
statusCode = {0, 'Semester fail';
              1, 'Mashrout';
              2, 'Normal';
              3, 'Top'};

fprintf('\nTotal units count: %.2f\n', result(1, 1));
fprintf('Average of scores: %.2f\n',   result(2, 1));
tmp = num2str(cell2mat(statusCode(result(3, 1), 2)));
fprintf('Student status: %s \n', tmp);