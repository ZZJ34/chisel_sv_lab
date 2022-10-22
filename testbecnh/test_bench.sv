module test_bench();

    logic reset_n; 
    logic clk;     

    // reset signal
    initial begin
        reset_n = 1'b0;
        # 25 reset_n = 1'b1;
    end

    // clock singal
    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
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
        .clk      (clk)           ,
        .reset_n  (reset_n)       ,
        ._if_i_ch0(input_ch_0)    ,
        ._if_i_ch1(input_ch_1)    ,
        ._if_i_ch2(input_ch_2)    ,
        ._if_i_ch3(input_ch_3)    ,
        ._if_i_ch4(input_ch_4)    ,
        ._if_i_ch5(input_ch_5)    ,
        ._if_i_ch6(input_ch_6)    ,
        ._if_i_ch7(input_ch_7)    ,

        ._if_o(output_ch)        
    );

    `include "./test_task.sv"

    
    // main
    initial begin

        put_data(10);

        get_data();
        
        $finish();
    end
    
endmodule