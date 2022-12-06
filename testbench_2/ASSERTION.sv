`timescale 1ns/1ps

module dut_assertion (
    input        clk         ,
    input        reset_n     ,

    input        valid_i_0   ,
    input  [7:0] data_i_0    ,
    input  [7:0] priority_i_0,
    input        ready_i_0   ,

    input        valid_i_1   ,
    input  [7:0] data_i_1    ,
    input  [7:0] priority_i_1,
    input        ready_i_1   ,

    input        valid_i_2   ,
    input  [7:0] data_i_2    ,
    input  [7:0] priority_i_2,
    input        ready_i_2   ,

    input        valid_i_3   ,
    input  [7:0] data_i_3    ,
    input  [7:0] priority_i_3,
    input        ready_i_3   ,

    input        valid_i_4   ,
    input  [7:0] data_i_4    ,
    input  [7:0] priority_i_4,
    input        ready_i_4   ,

    input        valid_i_5   ,
    input  [7:0] data_i_5    ,
    input  [7:0] priority_i_5,
    input        ready_i_5   ,

    input        valid_i_6   ,
    input  [7:0] data_i_6    ,
    input  [7:0] priority_i_6,
    input        ready_i_6   ,

    input        valid_i_7   ,
    input  [7:0] data_i_7    ,
    input  [7:0] priority_i_7,
    input        ready_i_7   ,

    input  [2:0] data_o      ,
    input        valid_o     ,
    input        ready_o    

);

    dut_channel_assertion sch0_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_0),
        .ready   (ready_i_0)
    );

    dut_channel_assertion sch1_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_1),
        .ready   (ready_i_1)
    );

    dut_channel_assertion sch2_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_2),
        .ready   (ready_i_2)
    );

    dut_channel_assertion sch3_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_3),
        .ready   (ready_i_3)
    );

    dut_channel_assertion sch4_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_4),
        .ready   (ready_i_4)
    );

    dut_channel_assertion sch5_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_5),
        .ready   (ready_i_5)
    );

    dut_channel_assertion sch6_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_6),
        .ready   (ready_i_6)
    );

    dut_channel_assertion sch7_assetion (
        .clk     (clk    ),
        .reset_n (reset_n),

        .valid   (valid_i_7),
        .ready   (ready_i_7)
    );

    dut_channel_assertion dch_assetion (
        .clk     (clk     ),
        .reset_n (reset_n ),

        .valid   (valid_o ),
        .ready   (ready_o )
    );

    logic doublef_clk;

	initial begin 
		doublef_clk    = 0 ;
		forever #(5/2) doublef_clk = ~doublef_clk;
	end

    logic [7:0] p_array [$] = '{0,1,2,3,4,5,6,7};
    logic [7:0] max [$];
    logic [7:0] max_value;
    int         max_index [$];
    logic [2:0] index_value;
    
    initial begin
        for (int i=0;i<100;i++) begin
            i = 0; 
            @(posedge doublef_clk);

            // step1
            if(valid_i_0) begin p_array[0] = priority_i_0 + 1; end else begin p_array[0] = 0; end
            if(valid_i_1) begin p_array[1] = priority_i_1 + 1; end else begin p_array[1] = 0; end
            if(valid_i_2) begin p_array[2] = priority_i_2 + 1; end else begin p_array[2] = 0; end
            if(valid_i_3) begin p_array[3] = priority_i_3 + 1; end else begin p_array[3] = 0; end
            if(valid_i_4) begin p_array[4] = priority_i_4 + 1; end else begin p_array[4] = 0; end
            if(valid_i_5) begin p_array[5] = priority_i_5 + 1; end else begin p_array[5] = 0; end
            if(valid_i_6) begin p_array[6] = priority_i_6 + 1; end else begin p_array[6] = 0; end
            if(valid_i_7) begin p_array[7] = priority_i_7 + 1; end else begin p_array[7] = 0; end

            // step2
            max = p_array.max();
            max_value = max[0];
            max_index = p_array.find_first_index with (item == max_value);
            index_value = max_index[0];

        end
    end

    sequence total_handshake(valid,ready);
        valid[*0:$] ##1
        valid && ready;
    endsequence

    property total_handshake_check;
        @(posedge clk) (
            (
                (
                 $rose(valid_i_0)||
                 $rose(valid_i_1)||
                 $rose(valid_i_2)||
                 $rose(valid_i_3)||
                 $rose(valid_i_4)||
                 $rose(valid_i_5)||
                 $rose(valid_i_6)||
                 $rose(valid_i_7)
                 ) || (              
                 ($past(valid_i_0 && ready_i_0,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_1 && ready_i_1,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_2 && ready_i_2,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_3 && ready_i_3,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_4 && ready_i_4,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_5 && ready_i_5,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_6 && ready_i_6,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7)) ||
                 ($past(valid_i_7 && ready_i_7,1) && (valid_i_0||valid_i_1||valid_i_2||valid_i_3||valid_i_4||valid_i_5||valid_i_6||valid_i_7))
                )
            ) |-> 

            if(index_value==0) (
                total_handshake(valid_i_0,ready_i_0)
            ) else ( if (index_value==1) (
                total_handshake(valid_i_1,ready_i_1)
            ) else ( if (index_value==2) (
                total_handshake(valid_i_2,ready_i_2)
            ) else ( if (index_value==3) (
                total_handshake(valid_i_3,ready_i_3)
            ) else ( if (index_value==4) (
                total_handshake(valid_i_4,ready_i_4)
            ) else ( if (index_value==5) (
                total_handshake(valid_i_5,ready_i_5)
            ) else ( if (index_value==6) (
                total_handshake(valid_i_6,ready_i_6)
            ) else ( if (index_value==7) (
                total_handshake(valid_i_7,ready_i_7)
            )
            )
            )
            )
            )
            )
            )
            )
        ) 
    endproperty

    handshake_check_total: assert property (total_handshake_check) else $error($stime,"\t\t FAIL::handshake_check_total\n");

endmodule

module dut_channel_assertion (
    input        clk     ,
    input        reset_n ,

    input        valid   ,
    input        ready 
);

    sequence handshake;
        valid[*0:$] ##1
        valid && ready;
    endsequence

    property ch_handshake_check;
        @(posedge clk) (
            (
                ($rose(valid)) ||                  // tri when : valid rise
                ($past(valid && ready,1) && valid) //            handshake before and valid still hold
            ) |-> 
                handshake
        ) 
    endproperty

    handshake_check_ch: assert property (ch_handshake_check) else $error($stime,"\t\t FAIL::handshake_check_ch\n");

endmodule