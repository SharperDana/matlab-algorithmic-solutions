% 207924499 & 213804289
% task 11

function write_and_read_text_file()

    % creating an array of strings
    data = {'Hello, MATLAB'; 'This code is alive'; 'Debugging is cool'; 'Save me from getframe pls'; '207924499'};

    % defining the file name and opening it for writing
    file_name = 'data_ascii.txt';
    fid = fopen(file_name, 'w');

    % checking if the file was opened successfully
    if fid == -1
        fprintf('שגיאה בכתיבת הקובץ.\n');
        return;
    end

    % writing each line from the array to the file
    for i = 1 : length(data)
        fprintf(fid, '%s\n', data{i});
    end

    % closing the file after writing is complete
    fclose(fid);
    fprintf('הקובץ %s נוצר בהצלחה\n', file_name);

    % asking the user to select the file to read
    [chosen_file, chosen_path] = uigetfile('*.txt', 'בחר קובץ לקריאה');
    if isequal(chosen_file, 0)
        fprintf('! לא נבחר קובץ\n');
        return;
    end

    % getting the full path to the selected file
    full_path = fullfile(chosen_path, chosen_file);

    % opening the selected file for reading
    fid = fopen(full_path, 'r');
    if fid == -1
        fprintf('הקובץ לא נמצא או לא ניתן לקריאה.\n');
        return;
    end

    % confirmation of successful opening and displaying the content
    fprintf('הקובץ נפתח בהצלחה: %s\n', full_path);
    fprintf('--- תוכן הקובץ ---\n');

    % reading and displaying each line with its number
    lines = {};
    line_number = 0;

    while ~feof(fid)
        line = fgetl(fid);
        if ischar(line) && ~isempty(strtrim(line))
            line_number = line_number + 1;
            lines{end+1} = line;
            fprintf('שורה %d: %s\n', line_number, line);
        end
    end

    % closing the file after reading
    fclose(fid);

    % checking if the file is empty / no lines were read
    if isempty(lines)
        fprintf('הקובץ ריק.\n');
    end
end