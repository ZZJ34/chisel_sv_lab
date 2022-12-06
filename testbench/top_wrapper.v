module top_wrapper (
    input        clk        ,
    input        reset_n    ,

    // channel_1
    input        valid_i_0      ,
    input  [7:0] data_i_0       ,
    input  [7:0] priority_i_0   ,
    output       ready_i_0      ,

    // channel_2
    input        valid_i_1      ,
    input  [7:0] data_i_1       ,
    input  [7:0] priority_i_1   ,
    output       ready_i_1      ,

    // channel_3
    input        valid_i_2      ,
    input  [7:0] data_i_2       ,
    input  [7:0] priority_i_2   ,
    output       ready_i_2      ,

    // channel_4
    input        valid_i_3      ,
    input  [7:0] data_i_3       ,
    input  [7:0] priority_i_3   ,
    output       ready_i_3      ,

    // channel_5
    input        valid_i_4      ,
    input  [7:0] data_i_4       ,
    input  [7:0] priority_i_4   ,
    output       ready_i_4      ,

    // channel_6
    input        valid_i_5      ,
    input  [7:0] data_i_5       ,
    input  [7:0] priority_i_5   ,
    output       ready_i_5      ,

    // channel_7
    input        valid_i_6      ,
    input  [7:0] data_i_6       ,
    input  [7:0] priority_i_6   ,
    output       ready_i_6      ,

    // channel_8
    input        valid_i_7      ,
    input  [7:0] data_i_7       ,
    input  [7:0] priority_i_7   ,
    output       ready_i_7      ,

    output [2:0] data_o         ,
    input        valid_o        ,
    output       ready_o
);

    // your code here ......
    Top i_top(
        .clock      (clk)       ,
        .reset      (~reset_n)  ,

        .io_valid_vec_i_0   (valid_i_0)     ,
        .io_valid_vec_i_1   (valid_i_1)     ,
        .io_valid_vec_i_2   (valid_i_2)     ,
        .io_valid_vec_i_3   (valid_i_3)     ,
        .io_valid_vec_i_4   (valid_i_4)     ,
        .io_valid_vec_i_5   (valid_i_5)     ,
        .io_valid_vec_i_6   (valid_i_6)     ,
        .io_valid_vec_i_7   (valid_i_7)     ,

        .io_data_vec_i_0    (data_i_0)      ,
        .io_data_vec_i_1    (data_i_1)      ,
        .io_data_vec_i_2    (data_i_2)      ,
        .io_data_vec_i_3    (data_i_3)      ,
        .io_data_vec_i_4    (data_i_4)      ,
        .io_data_vec_i_5    (data_i_5)      ,
        .io_data_vec_i_6    (data_i_6)      ,
        .io_data_vec_i_7    (data_i_7)      ,
        
        .io_priority_vec_i_0 (priority_i_0)   ,
        .io_priority_vec_i_1 (priority_i_1)   ,
        .io_priority_vec_i_2 (priority_i_2)   ,
        .io_priority_vec_i_3 (priority_i_3)   ,
        .io_priority_vec_i_4 (priority_i_4)   ,
        .io_priority_vec_i_5 (priority_i_5)   ,
        .io_priority_vec_i_6 (priority_i_6)   ,
        .io_priority_vec_i_7 (priority_i_7)   ,

        .io_ready_vec_i_0   (ready_i_0)     ,
        .io_ready_vec_i_1   (ready_i_1)     ,
        .io_ready_vec_i_2   (ready_i_2)     ,
        .io_ready_vec_i_3   (ready_i_3)     ,
        .io_ready_vec_i_4   (ready_i_4)     ,
        .io_ready_vec_i_5   (ready_i_5)     ,
        .io_ready_vec_i_6   (ready_i_6)     ,
        .io_ready_vec_i_7   (ready_i_7)     ,

        .io_data_o  (data_o)    ,
        .io_valid_o (valid_o)   ,
        .io_ready_o (ready_o)   
    );

endmodule