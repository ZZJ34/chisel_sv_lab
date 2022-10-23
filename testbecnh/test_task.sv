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

task put_data_0();
    input_ch_0.valid    = pkt.valid_array   [0];
    input_ch_0.data     = pkt.data_array    [0];
    input_ch_0.prioity  = pkt.prioity_array [0];
endtask

task put_data_1();
    input_ch_1.valid    = pkt.valid_array   [1];
    input_ch_1.data     = pkt.data_array    [1];
    input_ch_1.prioity  = pkt.prioity_array [1];
endtask

task put_data_2();
    input_ch_2.valid    = pkt.valid_array   [2];
    input_ch_2.data     = pkt.data_array    [2];
    input_ch_2.prioity  = pkt.prioity_array [2];
endtask

task put_data_3();
    input_ch_3.valid    = pkt.valid_array   [3];
    input_ch_3.data     = pkt.data_array    [3];
    input_ch_3.prioity  = pkt.prioity_array [3];
endtask

task put_data_4();
    input_ch_4.valid    = pkt.valid_array   [4];
    input_ch_4.data     = pkt.data_array    [4];
    input_ch_4.prioity  = pkt.prioity_array [4];
endtask

task put_data_5();
    input_ch_5.valid    = pkt.valid_array   [5];
    input_ch_5.data     = pkt.data_array    [5];
    input_ch_5.prioity  = pkt.prioity_array [5];
endtask

task put_data_6();
    input_ch_6.valid    = pkt.valid_array   [6];
    input_ch_6.data     = pkt.data_array    [6];
    input_ch_6.prioity  = pkt.prioity_array [6];
endtask

task put_data_7();
    input_ch_7.valid    = pkt.valid_array   [7];
    input_ch_7.data     = pkt.data_array    [7];
    input_ch_7.prioity  = pkt.prioity_array [7];
endtask

task put_data(int trans_num);  
    automatic int ch_index = -1;

    // wait reset disassert
    wait(time_if.reset_n == 1);
    @(posedge time_if.clk);

    // generate new data
    pkt = new();
    pkt.randomize();
    pkt.show_ch_info();

    // get and save grant channel
    ch_index = pkt.get_ch_index();
    trans_data.push_back(pkt.data_array[ch_index]);

    // put data on channel
    put_data_0();
    put_data_1();
    put_data_2();
    put_data_3();
    put_data_4();
    put_data_5();
    put_data_6();
    put_data_7();

    wait((input_ch_0.ready == 1'b1) || (input_ch_1.ready == 1'b1) || (input_ch_2.ready == 1'b1) ||
         (input_ch_3.ready == 1'b1) || (input_ch_4.ready == 1'b1) || (input_ch_5.ready == 1'b1) ||
         (input_ch_6.ready == 1'b1) || (input_ch_7.ready == 1'b1));
    @(posedge time_if.clk);

endtask

task get_data();

    // $display("%p", trans_data);

    // wait reset disassert
    wait(time_if.reset_n == 1);
    @(posedge time_if.clk);

    output_ch.valid = 1'b1;
    
endtask