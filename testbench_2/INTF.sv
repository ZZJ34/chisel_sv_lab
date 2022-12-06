interface duttb_intf_sourcechannel (
    input clk,
    input rst_n
    // these signals ared used if interactive exist with the port signals
);

//-----------------------------------------------------
// parameters
//-----------------------------------------------------

    localparam SDATA_W = 8;
    // data width of source channel

    localparam PRIORITY_W = 8; 
    // priority width of destination channel

//-----------------------------------------------------
// ios
//-----------------------------------------------------

    logic                  channel_valid   ;
    logic                  channel_ready   ;
    logic [PRIORITY_W-1:0] channel_priority;
    logic [SDATA_W-1   :0] channel_data    ;
    
//-----------------------------------------------------
// modports
//-----------------------------------------------------

    modport DUTconnect (
        input  channel_valid, channel_priority, channel_data,
        output channel_ready
    );

    modport TBconnect (
        input  clk,
        output channel_valid, channel_priority, channel_data,
        input  channel_ready
    );

endinterface



interface duttb_intf_destinationchannel (
    input clk,
    input rst_n
    // these signals ared used if interactive exist with the port signals
);

//-----------------------------------------------------
// parameters
//-----------------------------------------------------

    localparam DDATA_W = 3;
    // data width of destination channel 

//-----------------------------------------------------
// ios
//-----------------------------------------------------

    logic                  channel_valid   ;
    logic                  channel_ready   ;
    logic [DDATA_W-1   :0] channel_data    ;
    
//-----------------------------------------------------
// modports
//-----------------------------------------------------

    modport DUTconnect (
        output channel_ready, channel_data,
        input  channel_valid
    );

    modport TBconnect (
        input  clk,
        input  channel_ready, channel_data,
        output channel_valid
    );

endinterface