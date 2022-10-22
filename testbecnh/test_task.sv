class Input_Data;

    rand bit [7:0] data_array [8];
    rand bit [7:0] prioity_array [8];
    rand bit valid_array [8];

    constraint valid_array_c { 
        valid_array[0] |
        valid_array[1] |
        valid_array[2] |
        valid_array[3] |
        valid_array[4] |
        valid_array[5] |
        valid_array[6] |
        valid_array[7]  == 1'b1;
    }

    constraint prioity_array_c {unique {prioity_array};}

    // 打印各个通道的信息
    function void display();
        for(int i = 0; i < 8; i++) begin
            $write("| channel %8d |", i);
        end
        $write("\n");

        for(int i = 0; i < 8; i++) begin
            $write("| prioity %8b |", prioity_array[i]);
        end
        $write("\n");

        for(int i = 0; i < 8; i++) begin
            $write("| data    %8b |", data_array[i]);
        end
        $write("\n");

        for(int i = 0; i < 8; i++) begin
            $write("| valid   %8b |", valid_array[i]);
        end
        $write("\n");

        $write("\n");
    endfunction

endclass