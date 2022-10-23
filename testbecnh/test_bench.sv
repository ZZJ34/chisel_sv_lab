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

    
    // main
    initial begin
        fork
            begin
                put_data(10);
            end

            begin
                get_data();
            end
            
        join
        

        #50;
        
        $finish();
    end
    
endmodule