`timescale 1ns/1ns

module test_bench();

    global_if time_if();

    // reset signal
    initial begin
        time_if.reset_n = 1'b0;
        # 25 time_if.reset_n = 1'b1;
    end

    // clock singal
    initial begin
        time_if.clk = 1'b0;
        forever begin
            #5 time_if.clk = ~time_if.clk;
        end
    end

    // interface
    input_if input_ch_0();
    input_if input_ch_1();
    input_if input_ch_2();
    input_if input_ch_3();
    input_if input_ch_4();
    input_if input_ch_5();
    input_if input_ch_6();
    input_if input_ch_7();

    output_if output_ch();

    // dut
    top_if_wrapper i_top_if_wrapper(
        ._if_time(time_if.dut)       ,

        ._if_i_ch0(input_ch_0.dut)    ,
        ._if_i_ch1(input_ch_1.dut)    ,
        ._if_i_ch2(input_ch_2.dut)    ,
        ._if_i_ch3(input_ch_3.dut)    ,
        ._if_i_ch4(input_ch_4.dut)    ,
        ._if_i_ch5(input_ch_5.dut)    ,
        ._if_i_ch6(input_ch_6.dut)    ,
        ._if_i_ch7(input_ch_7.dut)    ,

        ._if_o(output_ch.dut)        
    );

    `include "./test_task.sv"

    // global par
    int trans_num = 30;
    int get_num = $floor(real'(trans_num*8/3));

    int trans_delay_max = 5;
    int get_delay_max = 10;

    
    // main
    initial begin
        fork
            // send data
            begin
                put_data(trans_num, trans_delay_max); 
            end
            // receive data
            begin
                get_data(get_num, get_delay_max);
            end
            // check data
            begin
                check_data(get_num);
            end
        join
        

        #50;

        $display("---------------------------------");
        $display("[check] all right : %d", right_num);
        $display("[check] all error : %d", error_num);
        $display("---------------------------------");
        
        $finish();
    end
    
endmodule