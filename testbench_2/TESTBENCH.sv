`timescale 1ns/1ps

module testbench_top ();

//-----------------------------------------------------
// parameters
//-----------------------------------------------------

    parameter    clk_period            = 10;

//-----------------------------------------------------
// signals define
//-----------------------------------------------------

    // uninterface signals 
    logic clk  ;
    logic rst_n;
    
    // interface signals 
    duttb_intf_sourcechannel      if_schannel_0(.*);
    duttb_intf_sourcechannel      if_schannel_1(.*);
    duttb_intf_sourcechannel      if_schannel_2(.*);
    duttb_intf_sourcechannel      if_schannel_3(.*);
    duttb_intf_sourcechannel      if_schannel_4(.*);
    duttb_intf_sourcechannel      if_schannel_5(.*);
    duttb_intf_sourcechannel      if_schannel_6(.*);
    duttb_intf_sourcechannel      if_schannel_7(.*);
    duttb_intf_destinationchannel if_dchannel(.*);

//-----------------------------------------------------
// signals fun
//-----------------------------------------------------
       
	initial begin 
		clk    = 0 ;
		forever #(clk_period/2) clk = ~clk;
	end

	initial begin
		rst_n   = 0;
		repeat(10) @(posedge clk) ;
		rst_n   = 1;
	end 

//-----------------------------------------------------
// connections
//-----------------------------------------------------

    testbench testbench(
        .clk   (clk       ),
        .rst_n (rst_n     ),

        // source channel connections
        .sch_0 (if_schannel_0),
        .sch_1 (if_schannel_1),
        .sch_2 (if_schannel_2),
        .sch_3 (if_schannel_3),
        .sch_4 (if_schannel_4),
        .sch_5 (if_schannel_5),
        .sch_6 (if_schannel_6),
        .sch_7 (if_schannel_7),
        
        // destiantion channel connections
        .dch   (if_dchannel  )
    ); 

    dut dut(
        .clk   (clk          ),
        .rst_n (rst_n        ),

        // source channel connections
        .sch_0 (if_schannel_0),
        .sch_1 (if_schannel_1),
        .sch_2 (if_schannel_2),
        .sch_3 (if_schannel_3),
        .sch_4 (if_schannel_4),
        .sch_5 (if_schannel_5),
        .sch_6 (if_schannel_6),
        .sch_7 (if_schannel_7),
        
        // destiantion channel connections
        .dch   (if_dchannel  )
    );
    
endmodule

program testbench(

    input clk  ,
    input rst_n,
    
    // your modport connection
    duttb_intf_sourcechannel.TBconnect sch_0,
    duttb_intf_sourcechannel.TBconnect sch_1,
    duttb_intf_sourcechannel.TBconnect sch_2,
    duttb_intf_sourcechannel.TBconnect sch_3,
    duttb_intf_sourcechannel.TBconnect sch_4,
    duttb_intf_sourcechannel.TBconnect sch_5,
    duttb_intf_sourcechannel.TBconnect sch_6,
    duttb_intf_sourcechannel.TBconnect sch_7,

    duttb_intf_destinationchannel.TBconnect dch

);
    
    import env ::*;
    env_ctrl envctrl; // first declare it

    initial begin
        
        $display("[TB-SYS] welcome to sv testbench plateform !");

        // BUILD
        // ---------------------------------------------------        
        // the first step in testbench is build your env object 
        // as your command manager, after that you can call it
        // also with its subordinates
        $display("[TB-SYS] building");
        envctrl = new();

        // CONNECT
        // ---------------------------------------------------
        // let your manager connected to your dut by interface
        $display("[TB-SYS] connecting");
        envctrl.set_interface(
            sch_0,
            sch_1,
            sch_2,
            sch_3,
            sch_4,
            sch_5,
            sch_6,
            sch_7,
            dch
        );

        // RUN
        // ---------------------------------------------------
        // give command to your env object
        $display("[TB-SYS] running");

        // (1) waiting for rst done in dut
        repeat(11) @(posedge clk) ;
        
        // (2) add your fun here
        envctrl.run("Config_Priority_01234567");

        fork
            begin
                envctrl.run("Start_Source_Agent");
                fork
                    begin 
                        #100; 
                        envctrl.run("Start_Source_Agent_Plus"); 
                    end
                    begin 
                        envctrl.run("Start_Destination_Agent_always");
                        #300;
                        fork
                            envctrl.run("Config_Priority_76543210");
                            begin
                                #200; 
                                envctrl.run("Start_Destination_Agent");
                            end
                        join
                    end
                join
            end
            envctrl.run("Time_Run");
        join_any
        disable fork;  

        #100;      

        // END
        // ---------------------------------------------------        
        $display("[TB-SYS] testbench system has done all the work, exit !");

    end

endprogram