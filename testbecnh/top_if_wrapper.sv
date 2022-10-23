module top_if_wrapper(
    global_if    _if_time     ,

    input_if     _if_i_ch0    ,
    input_if     _if_i_ch1    ,
    input_if     _if_i_ch2    ,
    input_if     _if_i_ch3    ,
    input_if     _if_i_ch4    ,
    input_if     _if_i_ch5    ,
    input_if     _if_i_ch6    ,
    input_if     _if_i_ch7    ,

    output_if    _if_o        
);

    top_wrapper i_top_wrapper(
        .clk    (_if_time.clk)           ,
        .reset_n(_if_time.reset_n)       ,

        // channel_1
        .valid_i_0  (_if_i_ch0.valid)    ,
        .data_i_0   (_if_i_ch0.data)     ,
        .prioity_i_0(_if_i_ch0.prioity)  ,
        .ready_i_0  (_if_i_ch0.ready)    ,

        // channel_2
        .valid_i_1  (_if_i_ch1.valid)    ,
        .data_i_1   (_if_i_ch1.data)     ,
        .prioity_i_1(_if_i_ch1.prioity)  ,
        .ready_i_1  (_if_i_ch1.ready)    ,
    
        // channel_3
        .valid_i_2  (_if_i_ch2.valid)    ,
        .data_i_2   (_if_i_ch2.data)     ,
        .prioity_i_2(_if_i_ch2.prioity)  ,
        .ready_i_2  (_if_i_ch2.ready)    ,

        // channel_4
        .valid_i_3  (_if_i_ch3.valid)    ,
        .data_i_3   (_if_i_ch3.data)     ,
        .prioity_i_3(_if_i_ch3.prioity)  ,
        .ready_i_3  (_if_i_ch3.ready)    ,

        // channel_5
        .valid_i_4  (_if_i_ch4.valid)    ,
        .data_i_4   (_if_i_ch4.data)     ,
        .prioity_i_4(_if_i_ch4.prioity)  ,
        .ready_i_4  (_if_i_ch4.ready)    ,
    
        // channel_6
        .valid_i_5  (_if_i_ch5.valid)    ,
        .data_i_5   (_if_i_ch5.data)     ,
        .prioity_i_5(_if_i_ch5.prioity)  ,
        .ready_i_5  (_if_i_ch5.ready)    ,
    
        // channel_7
        .valid_i_6  (_if_i_ch6.valid)    ,
        .data_i_6   (_if_i_ch6.data)     ,
        .prioity_i_6(_if_i_ch6.prioity)  ,
        .ready_i_6  (_if_i_ch6.ready)    ,

        // channel_8
        .valid_i_7  (_if_i_ch7.valid)    ,
        .data_i_7   (_if_i_ch7.data)     ,
        .prioity_i_7(_if_i_ch7.prioity)  ,
        .ready_i_7  (_if_i_ch7.ready)    ,
    
        .data_o (_if_o.data)     ,
        .valid_o(_if_o.valid)    ,
        .ready_o(_if_o.ready)
);
endmodule