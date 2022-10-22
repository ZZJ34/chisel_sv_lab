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

    function void show_ch_info();
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

    function int get_ch_index();
        bit [7:0] max_prioity = 8'b0;
        int ch_index = -1;

        for(int i=0; i<8; i++) begin
            if((prioity_array[i] > max_prioity) && valid_array[i] ) max_prioity = prioity_array[i];
        end
        
        for(int i=0; i<8; i++) begin
            if(valid_array[i] && (prioity_array[i] == max_prioity)) ch_index = i;
        end

        if(ch_index == -1) begin
            $display("Error: get grant channel failed");
        end
        else begin
            $display("grant channel");
            $display("channel %8d", ch_index);
            $display("prioity %8b", prioity_array[ch_index]);
            $display("data    %8b", data_array[ch_index]);
            $display("valid   %8b", valid_array[ch_index]);
            $display();
        end

        return ch_index;
    endfunction

endclass

bit [7:0] trans_data [$];

int       data_index = 0;
bit [2:0] bit_index  = 0;

Input_Data pkt;

task put_data(int trans_num);
     
    automatic int ch_index = -1;

    repeat(trans_num) begin
        pkt = new();
        pkt.randomize();
        pkt.show_ch_info();

        ch_index = pkt.get_ch_index();
        
        trans_data.push_back(pkt.data_array[ch_index]);
    end

endtask

task get_data();

    $display("%p", trans_data);
    
endtask