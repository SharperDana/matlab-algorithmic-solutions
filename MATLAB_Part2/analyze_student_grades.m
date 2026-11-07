% 207924499 & 213804289
% task 6

function analyze_student_grades()

    % names and grades of the students
    names = {'דנה', 'נימי', 'יוסי', 'תדהר', 'רוני'};
    grades = [84 88 91;
              95 97 99;
              72 68 75;
              55 60 58;
              81 83 80];

    % calculating average for each student (row-wise)
    student_average = mean(grades, 2);

    % calculating and printing course average
    course_average = mean(student_average);
    fprintf('ממוצע הקורס הוא: %.4f\n', course_average);

    % finding students with an average below the course average
    below_average = names(student_average < course_average);
    fprintf('\nהתלמידים שממוצעם נמוך מממוצע הקורס:\n');
    disp(below_average');

    % finding students with an average above the course average
    above_average = names(student_average > course_average);
    fprintf('\nהתלמידים שממוצעם גבוה מממוצע הקורס:\n');
    disp(above_average');

    % calculating percentage of students above average
    percent_above_average = (length(above_average) / length(names)) * 100;
    fprintf('\nאחוז התלמידים שקיבלו ציון מעל ממוצע הקורס הוא: %.1f%%\n', percent_above_average);
end