module dut (

    input clk  ,
    input rst_n,
    
    // your modport connection
    duttb_intf_sourcechannel.DUTconnect sch_0,
    duttb_intf_sourcechannel.DUTconnect sch_1,
    duttb_intf_sourcechannel.DUTconnect sch_2,
    duttb_intf_sourcechannel.DUTconnect sch_3,
    duttb_intf_sourcechannel.DUTconnect sch_4,
    duttb_intf_sourcechannel.DUTconnect sch_5,
    duttb_intf_sourcechannel.DUTconnect sch_6,
    duttb_intf_sourcechannel.DUTconnect sch_7,

    duttb_intf_destinationchannel.DUTconnect dch

);

    top_wrapper top_wrapper (
    
        .clk     (clk  ),
        .reset_n (rst_n),
        
        // your modport connection
        .valid_i_0    (sch_0.channel_valid   ),
        .data_i_0     (sch_0.channel_data    ),
        .priority_i_0 (sch_0.channel_priority),
        .ready_i_0    (sch_0.channel_ready   ),
    
        .valid_i_1    (sch_1.channel_valid   ),
        .data_i_1     (sch_1.channel_data    ),
        .priority_i_1 (sch_1.channel_priority),
        .ready_i_1    (sch_1.channel_ready   ),
    
        .valid_i_2    (sch_2.channel_valid   ),
        .data_i_2     (sch_2.channel_data    ),
        .priority_i_2 (sch_2.channel_priority),
        .ready_i_2    (sch_2.channel_ready   ),
    
        .valid_i_3    (sch_3.channel_valid   ),
        .data_i_3     (sch_3.channel_data    ),
        .priority_i_3 (sch_3.channel_priority),
        .ready_i_3    (sch_3.channel_ready   ),
    
        .valid_i_4    (sch_4.channel_valid   ),
        .data_i_4     (sch_4.channel_data    ),
        .priority_i_4 (sch_4.channel_priority),
        .ready_i_4    (sch_4.channel_ready   ),
    
        .valid_i_5    (sch_5.channel_valid   ),
        .data_i_5     (sch_5.channel_data    ),
        .priority_i_5 (sch_5.channel_priority),
        .ready_i_5    (sch_5.channel_ready   ),
    
        .valid_i_6    (sch_6.channel_valid   ),
        .data_i_6     (sch_6.channel_data    ),
        .priority_i_6 (sch_6.channel_priority),
        .ready_i_6    (sch_6.channel_ready   ),
    
        .valid_i_7    (sch_7.channel_valid   ),
        .data_i_7     (sch_7.channel_data    ),
        .priority_i_7 (sch_7.channel_priority),
        .ready_i_7    (sch_7.channel_ready   ),
    
        .data_o       (dch.channel_data  ),     
        .valid_o      (dch.channel_valid ),     
        .ready_o      (dch.channel_ready )
    
    );

    bind top_wrapper dut_assertion dut_assertion_bind_top_wrapper (
    
        .clk     (clk  ),
        .reset_n (rst_n),
        
        .valid_i_0    (sch_0.channel_valid   ),
        .data_i_0     (sch_0.channel_data    ),
        .priority_i_0 (sch_0.channel_priority),
        .ready_i_0    (sch_0.channel_ready   ),
    
        .valid_i_1    (sch_1.channel_valid   ),
        .data_i_1     (sch_1.channel_data    ),
        .priority_i_1 (sch_1.channel_priority),
        .ready_i_1    (sch_1.channel_ready   ),
    
        .valid_i_2    (sch_2.channel_valid   ),
        .data_i_2     (sch_2.channel_data    ),
        .priority_i_2 (sch_2.channel_priority),
        .ready_i_2    (sch_2.channel_ready   ),
    
        .valid_i_3    (sch_3.channel_valid   ),
        .data_i_3     (sch_3.channel_data    ),
        .priority_i_3 (sch_3.channel_priority),
        .ready_i_3    (sch_3.channel_ready   ),
    
        .valid_i_4    (sch_4.channel_valid   ),
        .data_i_4     (sch_4.channel_data    ),
        .priority_i_4 (sch_4.channel_priority),
        .ready_i_4    (sch_4.channel_ready   ),
    
        .valid_i_5    (sch_5.channel_valid   ),
        .data_i_5     (sch_5.channel_data    ),
        .priority_i_5 (sch_5.channel_priority),
        .ready_i_5    (sch_5.channel_ready   ),
    
        .valid_i_6    (sch_6.channel_valid   ),
        .data_i_6     (sch_6.channel_data    ),
        .priority_i_6 (sch_6.channel_priority),
        .ready_i_6    (sch_6.channel_ready   ),
    
        .valid_i_7    (sch_7.channel_valid   ),
        .data_i_7     (sch_7.channel_data    ),
        .priority_i_7 (sch_7.channel_priority),
        .ready_i_7    (sch_7.channel_ready   ),
    
        .data_o       (dch.channel_data  ),     
        .valid_o      (dch.channel_valid ),     
        .ready_o      (dch.channel_ready )
    
    ); 

endmodule