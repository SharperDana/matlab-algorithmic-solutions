% question 9.A
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function recreating_drawing()
    drawing = [
            "                      המוח                         הריט        ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                    _ _ _ _ _                                   ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                  _ _ _ _ _ _     ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [_ _ _ _ _]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                                               |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                     ךרח ירי                   |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                    _ _ _ _ _                  |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                      ןולח   |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "                   [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            ".                  [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            " \0 _              [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            "  I                [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "                                                                ";
            " / \               [         ]                 |           |    ";
            "                                                                ";
            "                                                                ";
            "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  "];
    
        % Define color mapping for different characters
        map_color = containers.Map();
        map_color('[') = [1, 1, 0];   % yellow
        map_color(']') = [0, 0, 1];   % blue
        map_color('I') = [1, 0, 0];   % red
        map_color('~') = [0, 1, 0];   % green
        map_color('\\') = [0, 0, 0]; % black
        map_color('_') = [0, 0, 0]; % black
        map_color('|') = [0, 0, 0]; % black
        map_color('-') = [0, 0, 0];   % black
        map_color('0') = [1, 0.5, 0]; % orange
       
        figure('Color', 'white');
        axis equal off; hold on;
    
        fontSize = 16; fontSpacing = 1.5; lineSpacing = 1.2;
    
        for row = 1:numel(drawing) % going through each row
            row_string = drawing{row};
            for char = 1:length(row_string) % going through each character in this row
                char_value = row_string(char);
                
                if char_value == '|' % setting the color of the '|' characteר
                    if char < 50  % approximate middle of the drawing
                        color_value = [1, 1, 0]; % yellow for left side
                    else
                        color_value = [0, 0, 1]; % blue for right side
                    end
                elseif isKey(map_color, char_value) % other characters
                    color_value = map_color(char_value); % coloring according to what was set in the beginning
                else
                    color_value = [0, 0, 0]; % black
                end
                
                % plotting this single character
                text(char * fontSpacing, -row * lineSpacing, char_value, 'Color', color_value, 'FontName', 'Courier', 'FontSize', fontSize, 'Interpreter','none');
            end
        end
        
        xlim([0, max(cellfun(@length, drawing)) * fontSpacing + 1])
        ylim([-numel(drawing) * lineSpacing - 1, 0])
end