module DataPath_Mux(
  input        io_valid_vec_0,
  input        io_valid_vec_1,
  input        io_valid_vec_2,
  input        io_valid_vec_3,
  input        io_valid_vec_4,
  input        io_valid_vec_5,
  input        io_valid_vec_6,
  input        io_valid_vec_7,
  input  [7:0] io_data_vec_0,
  input  [7:0] io_data_vec_1,
  input  [7:0] io_data_vec_2,
  input  [7:0] io_data_vec_3,
  input  [7:0] io_data_vec_4,
  input  [7:0] io_data_vec_5,
  input  [7:0] io_data_vec_6,
  input  [7:0] io_data_vec_7,
  input  [7:0] io_prioity_vec_0,
  input  [7:0] io_prioity_vec_1,
  input  [7:0] io_prioity_vec_2,
  input  [7:0] io_prioity_vec_3,
  input  [7:0] io_prioity_vec_4,
  input  [7:0] io_prioity_vec_5,
  input  [7:0] io_prioity_vec_6,
  input  [7:0] io_prioity_vec_7,
  output       io_ready_vec_0,
  output       io_ready_vec_1,
  output       io_ready_vec_2,
  output       io_ready_vec_3,
  output       io_ready_vec_4,
  output       io_ready_vec_5,
  output       io_ready_vec_6,
  output       io_ready_vec_7,
  output       io_valid_grant,
  input        io_ready_grant,
  output [7:0] io_data_grant
);
  wire [7:0] prioity_vec_temp_1 = io_prioity_vec_1 > io_prioity_vec_0 ? io_prioity_vec_1 : io_prioity_vec_0; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_2 = io_prioity_vec_2 > prioity_vec_temp_1 ? io_prioity_vec_2 : prioity_vec_temp_1; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_3 = io_prioity_vec_3 > prioity_vec_temp_2 ? io_prioity_vec_3 : prioity_vec_temp_2; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_4 = io_prioity_vec_4 > prioity_vec_temp_3 ? io_prioity_vec_4 : prioity_vec_temp_3; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_5 = io_prioity_vec_5 > prioity_vec_temp_4 ? io_prioity_vec_5 : prioity_vec_temp_4; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_6 = io_prioity_vec_6 > prioity_vec_temp_5 ? io_prioity_vec_6 : prioity_vec_temp_5; // @[DataPath_Mux.scala 28:39]
  wire [7:0] prioity_vec_temp_7 = io_prioity_vec_7 > prioity_vec_temp_6 ? io_prioity_vec_7 : prioity_vec_temp_6; // @[DataPath_Mux.scala 28:39]
  wire  _valid_vec_temp_1_T = io_prioity_vec_0 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_1 = io_prioity_vec_0 == prioity_vec_temp_7 & io_valid_vec_0; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_1 = _valid_vec_temp_1_T ? io_data_vec_0 : 8'h0; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_2_T = io_prioity_vec_1 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_2 = io_prioity_vec_1 == prioity_vec_temp_7 ? io_valid_vec_1 : valid_vec_temp_1; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_2 = _valid_vec_temp_2_T ? io_data_vec_1 : data_vec_temp_1; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_3_T = io_prioity_vec_2 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_3 = io_prioity_vec_2 == prioity_vec_temp_7 ? io_valid_vec_2 : valid_vec_temp_2; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_3 = _valid_vec_temp_3_T ? io_data_vec_2 : data_vec_temp_2; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_4_T = io_prioity_vec_3 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_4 = io_prioity_vec_3 == prioity_vec_temp_7 ? io_valid_vec_3 : valid_vec_temp_3; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_4 = _valid_vec_temp_4_T ? io_data_vec_3 : data_vec_temp_3; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_5_T = io_prioity_vec_4 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_5 = io_prioity_vec_4 == prioity_vec_temp_7 ? io_valid_vec_4 : valid_vec_temp_4; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_5 = _valid_vec_temp_5_T ? io_data_vec_4 : data_vec_temp_4; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_6_T = io_prioity_vec_5 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_6 = io_prioity_vec_5 == prioity_vec_temp_7 ? io_valid_vec_5 : valid_vec_temp_5; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_6 = _valid_vec_temp_6_T ? io_data_vec_5 : data_vec_temp_5; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_7_T = io_prioity_vec_6 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  wire  valid_vec_temp_7 = io_prioity_vec_6 == prioity_vec_temp_7 ? io_valid_vec_6 : valid_vec_temp_6; // @[DataPath_Mux.scala 41:39]
  wire [7:0] data_vec_temp_7 = _valid_vec_temp_7_T ? io_data_vec_6 : data_vec_temp_6; // @[DataPath_Mux.scala 42:38]
  wire  _valid_vec_temp_8_T = io_prioity_vec_7 == prioity_vec_temp_7; // @[DataPath_Mux.scala 41:62]
  assign io_ready_vec_0 = _valid_vec_temp_1_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_1 = _valid_vec_temp_2_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_2 = _valid_vec_temp_3_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_3 = _valid_vec_temp_4_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_4 = _valid_vec_temp_5_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_5 = _valid_vec_temp_6_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_6 = _valid_vec_temp_7_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_ready_vec_7 = _valid_vec_temp_8_T & io_ready_grant; // @[DataPath_Mux.scala 47:35]
  assign io_valid_grant = io_prioity_vec_7 == prioity_vec_temp_7 ? io_valid_vec_7 : valid_vec_temp_7; // @[DataPath_Mux.scala 41:39]
  assign io_data_grant = _valid_vec_temp_8_T ? io_data_vec_7 : data_vec_temp_7; // @[DataPath_Mux.scala 42:38]
endmodule
module FIFO(
  input        clock,
  input        reset,
  output [2:0] io_data_o,
  input        io_read_en,
  output       io_is_empty,
  input  [2:0] io_data_i,
  input        io_write_en,
  output       io_is_full
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram [0:15]; // @[FIFO.scala 19:18]
  wire  ram_io_data_o_MPORT_en; // @[FIFO.scala 19:18]
  wire [3:0] ram_io_data_o_MPORT_addr; // @[FIFO.scala 19:18]
  wire [2:0] ram_io_data_o_MPORT_data; // @[FIFO.scala 19:18]
  wire [2:0] ram_MPORT_data; // @[FIFO.scala 19:18]
  wire [3:0] ram_MPORT_addr; // @[FIFO.scala 19:18]
  wire  ram_MPORT_mask; // @[FIFO.scala 19:18]
  wire  ram_MPORT_en; // @[FIFO.scala 19:18]
  reg [4:0] read_pointer; // @[FIFO.scala 25:31]
  reg [4:0] write_pointer; // @[FIFO.scala 26:32]
  reg  is_empty_reg; // @[FIFO.scala 29:31]
  reg  is_full_reg; // @[FIFO.scala 30:30]
  wire  _write_pointer_next_T = ~is_full_reg; // @[FIFO.scala 33:63]
  wire  _write_pointer_next_T_1 = io_write_en & ~is_full_reg; // @[FIFO.scala 33:60]
  wire [4:0] _GEN_5 = {{4'd0}, _write_pointer_next_T_1}; // @[FIFO.scala 33:41]
  wire [4:0] write_pointer_next = write_pointer + _GEN_5; // @[FIFO.scala 33:41]
  wire  _read_pointer_next_T_1 = io_read_en & ~is_empty_reg; // @[FIFO.scala 34:57]
  wire [4:0] _GEN_6 = {{4'd0}, _read_pointer_next_T_1}; // @[FIFO.scala 34:39]
  wire [4:0] read_pointer_next = read_pointer + _GEN_6; // @[FIFO.scala 34:39]
  wire  _is_full_reg_T_1 = ~write_pointer_next[4]; // @[FIFO.scala 40:24]
  wire [4:0] _is_full_reg_T_3 = {_is_full_reg_T_1,write_pointer_next[3:0]}; // @[Cat.scala 31:58]
  assign ram_io_data_o_MPORT_en = 1'h1;
  assign ram_io_data_o_MPORT_addr = read_pointer[3:0];
  assign ram_io_data_o_MPORT_data = ram[ram_io_data_o_MPORT_addr]; // @[FIFO.scala 19:18]
  assign ram_MPORT_data = io_data_i;
  assign ram_MPORT_addr = write_pointer[3:0];
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = _write_pointer_next_T & io_write_en;
  assign io_data_o = ram_io_data_o_MPORT_data; // @[FIFO.scala 49:15]
  assign io_is_empty = is_empty_reg; // @[FIFO.scala 36:17]
  assign io_is_full = is_full_reg; // @[FIFO.scala 37:16]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[FIFO.scala 19:18]
    end
    if (reset) begin // @[FIFO.scala 25:31]
      read_pointer <= 5'h0; // @[FIFO.scala 25:31]
    end else begin
      read_pointer <= read_pointer_next; // @[FIFO.scala 25:31]
    end
    if (reset) begin // @[FIFO.scala 26:32]
      write_pointer <= 5'h0; // @[FIFO.scala 26:32]
    end else begin
      write_pointer <= write_pointer_next; // @[FIFO.scala 26:32]
    end
    is_empty_reg <= reset | read_pointer_next == write_pointer; // @[FIFO.scala 29:{31,31} 41:18]
    if (reset) begin // @[FIFO.scala 30:30]
      is_full_reg <= 1'h0; // @[FIFO.scala 30:30]
    end else begin
      is_full_reg <= _is_full_reg_T_3 == read_pointer; // @[FIFO.scala 40:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[2:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  read_pointer = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  write_pointer = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  is_empty_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  is_full_reg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DataPath_8to3(
  input        clock,
  input        reset,
  input        io_handshake_i_valid,
  output       io_handshake_i_ready,
  input  [7:0] io_data_i,
  input        io_handshake_o_valid,
  output       io_handshake_o_ready,
  output [2:0] io_data_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  FIFO_clock; // @[DataPath_8to3.scala 27:22]
  wire  FIFO_reset; // @[DataPath_8to3.scala 27:22]
  wire [2:0] FIFO_io_data_o; // @[DataPath_8to3.scala 27:22]
  wire  FIFO_io_read_en; // @[DataPath_8to3.scala 27:22]
  wire  FIFO_io_is_empty; // @[DataPath_8to3.scala 27:22]
  wire [2:0] FIFO_io_data_i; // @[DataPath_8to3.scala 27:22]
  wire  FIFO_io_write_en; // @[DataPath_8to3.scala 27:22]
  wire  FIFO_io_is_full; // @[DataPath_8to3.scala 27:22]
  reg [1:0] leave_2bit; // @[DataPath_8to3.scala 24:29]
  reg  leave_1bit; // @[DataPath_8to3.scala 25:29]
  reg [3:0] state_reg; // @[DataPath_8to3.scala 36:28]
  reg [1:0] flag_reg; // @[DataPath_8to3.scala 39:27]
  wire [3:0] _GEN_0 = flag_reg == 2'h0 ? 4'h1 : state_reg; // @[DataPath_8to3.scala 36:28 45:{42,54}]
  wire [3:0] _GEN_1 = flag_reg == 2'h1 ? 4'h3 : _GEN_0; // @[DataPath_8to3.scala 46:{42,54}]
  wire  _T_4 = 4'h1 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire  _T_5 = 4'h2 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_5 = io_handshake_i_valid ? 4'h3 : 4'h0; // @[DataPath_8to3.scala 63:43 64:31 66:31]
  wire [3:0] _GEN_6 = FIFO_io_is_full ? 4'h2 : _GEN_5; // @[DataPath_8to3.scala 60:34 61:27]
  wire  _T_6 = 4'h3 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_7 = FIFO_io_is_full ? 4'h3 : 4'h4; // @[DataPath_8to3.scala 73:34 74:27 76:27]
  wire  _T_7 = 4'h4 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_8 = FIFO_io_is_full ? 4'h4 : 4'h5; // @[DataPath_8to3.scala 82:34 83:27 85:27]
  wire  _T_8 = 4'h5 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_9 = io_handshake_i_valid ? 4'h6 : 4'h0; // @[DataPath_8to3.scala 92:43 93:31 95:31]
  wire [3:0] _GEN_10 = FIFO_io_is_full ? 4'h5 : _GEN_9; // @[DataPath_8to3.scala 89:34 90:27]
  wire  _T_9 = 4'h6 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_11 = FIFO_io_is_full ? 4'h6 : 4'h7; // @[DataPath_8to3.scala 102:34 103:27 105:27]
  wire  _T_10 = 4'h7 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_12 = FIFO_io_is_full ? 4'h7 : 4'h8; // @[DataPath_8to3.scala 109:34 110:27 112:27]
  wire  _T_11 = 4'h8 == state_reg; // @[DataPath_8to3.scala 42:22]
  wire [3:0] _GEN_13 = io_handshake_i_valid ? 4'h1 : 4'h0; // @[DataPath_8to3.scala 119:43 120:31 122:31]
  wire [3:0] _GEN_14 = FIFO_io_is_full ? 4'h8 : _GEN_13; // @[DataPath_8to3.scala 116:34 117:27]
  wire [3:0] _GEN_15 = 4'h8 == state_reg ? _GEN_14 : state_reg; // @[DataPath_8to3.scala 42:22 36:28]
  wire [1:0] _GEN_16 = 4'h8 == state_reg ? 2'h0 : flag_reg; // @[DataPath_8to3.scala 126:22 42:22 39:27]
  wire [3:0] _GEN_17 = 4'h7 == state_reg ? _GEN_12 : _GEN_15; // @[DataPath_8to3.scala 42:22]
  wire [1:0] _GEN_18 = 4'h7 == state_reg ? flag_reg : _GEN_16; // @[DataPath_8to3.scala 42:22 39:27]
  wire [3:0] _GEN_19 = 4'h6 == state_reg ? _GEN_11 : _GEN_17; // @[DataPath_8to3.scala 42:22]
  wire [1:0] _GEN_20 = 4'h6 == state_reg ? flag_reg : _GEN_18; // @[DataPath_8to3.scala 42:22 39:27]
  wire [3:0] _GEN_21 = 4'h5 == state_reg ? _GEN_10 : _GEN_19; // @[DataPath_8to3.scala 42:22]
  wire [1:0] _GEN_22 = 4'h5 == state_reg ? 2'h2 : _GEN_20; // @[DataPath_8to3.scala 42:22 99:22]
  wire [3:0] _GEN_23 = 4'h4 == state_reg ? _GEN_8 : _GEN_21; // @[DataPath_8to3.scala 42:22]
  wire [1:0] _GEN_24 = 4'h4 == state_reg ? flag_reg : _GEN_22; // @[DataPath_8to3.scala 42:22 39:27]
  wire [3:0] _GEN_25 = 4'h3 == state_reg ? _GEN_7 : _GEN_23; // @[DataPath_8to3.scala 42:22]
  wire  _GEN_26 = 4'h3 == state_reg ? io_data_i[7] : leave_1bit; // @[DataPath_8to3.scala 42:22 79:24 25:29]
  wire [1:0] _GEN_27 = 4'h3 == state_reg ? flag_reg : _GEN_24; // @[DataPath_8to3.scala 42:22 39:27]
  wire [2:0] _data_i_wire_T_3 = {io_data_i[0],leave_2bit}; // @[Cat.scala 31:58]
  wire [2:0] _data_i_wire_T_7 = {io_data_i[1:0],leave_1bit}; // @[Cat.scala 31:58]
  wire [2:0] _GEN_40 = _T_11 ? io_data_i[7:5] : 3'h0; // @[DataPath_8to3.scala 137:22 168:25]
  wire  _GEN_41 = _T_10 | _T_11; // @[DataPath_8to3.scala 137:22 163:27]
  wire [2:0] _GEN_42 = _T_10 ? io_data_i[4:2] : _GEN_40; // @[DataPath_8to3.scala 137:22 164:25]
  wire  _GEN_43 = _T_9 | _GEN_41; // @[DataPath_8to3.scala 137:22 159:27]
  wire [2:0] _GEN_44 = _T_9 ? _data_i_wire_T_7 : _GEN_42; // @[DataPath_8to3.scala 137:22 160:25]
  wire  _GEN_45 = _T_8 | _GEN_43; // @[DataPath_8to3.scala 137:22 155:27]
  wire [2:0] _GEN_46 = _T_8 ? io_data_i[6:4] : _GEN_44; // @[DataPath_8to3.scala 137:22 156:25]
  wire  _GEN_47 = _T_7 | _GEN_45; // @[DataPath_8to3.scala 137:22 151:27]
  wire [2:0] _GEN_48 = _T_7 ? io_data_i[3:1] : _GEN_46; // @[DataPath_8to3.scala 137:22 152:25]
  wire  _GEN_49 = _T_6 | _GEN_47; // @[DataPath_8to3.scala 137:22 147:27]
  wire [2:0] _GEN_50 = _T_6 ? _data_i_wire_T_3 : _GEN_48; // @[DataPath_8to3.scala 137:22 148:25]
  wire  _GEN_51 = _T_5 | _GEN_49; // @[DataPath_8to3.scala 137:22 143:27]
  wire [2:0] _GEN_52 = _T_5 ? io_data_i[5:3] : _GEN_50; // @[DataPath_8to3.scala 137:22 144:25]
  FIFO FIFO ( // @[DataPath_8to3.scala 27:22]
    .clock(FIFO_clock),
    .reset(FIFO_reset),
    .io_data_o(FIFO_io_data_o),
    .io_read_en(FIFO_io_read_en),
    .io_is_empty(FIFO_io_is_empty),
    .io_data_i(FIFO_io_data_i),
    .io_write_en(FIFO_io_write_en),
    .io_is_full(FIFO_io_is_full)
  );
  assign io_handshake_i_ready = (state_reg == 4'h2 | state_reg == 4'h5 | state_reg == 4'h8) & ~FIFO_io_is_full; // @[DataPath_8to3.scala 171:124]
  assign io_handshake_o_ready = io_handshake_o_valid & ~FIFO_io_is_empty; // @[DataPath_8to3.scala 175:50]
  assign io_data_o = FIFO_io_data_o; // @[DataPath_8to3.scala 176:15]
  assign FIFO_clock = clock;
  assign FIFO_reset = reset;
  assign FIFO_io_read_en = io_handshake_o_valid; // @[DataPath_8to3.scala 174:21]
  assign FIFO_io_data_i = _T_4 ? io_data_i[2:0] : _GEN_52; // @[DataPath_8to3.scala 137:22 140:25]
  assign FIFO_io_write_en = _T_4 | _GEN_51; // @[DataPath_8to3.scala 137:22 139:27]
  always @(posedge clock) begin
    if (reset) begin // @[DataPath_8to3.scala 24:29]
      leave_2bit <= 2'h0; // @[DataPath_8to3.scala 24:29]
    end else if (!(4'h0 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
      if (4'h1 == state_reg) begin // @[DataPath_8to3.scala 42:22]
        leave_2bit <= io_data_i[7:6]; // @[DataPath_8to3.scala 57:24]
      end
    end
    if (reset) begin // @[DataPath_8to3.scala 25:29]
      leave_1bit <= 1'h0; // @[DataPath_8to3.scala 25:29]
    end else if (!(4'h0 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
      if (!(4'h1 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
        if (!(4'h2 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
          leave_1bit <= _GEN_26;
        end
      end
    end
    if (reset) begin // @[DataPath_8to3.scala 36:28]
      state_reg <= 4'h0; // @[DataPath_8to3.scala 36:28]
    end else if (4'h0 == state_reg) begin // @[DataPath_8to3.scala 42:22]
      if (io_handshake_i_valid) begin // @[DataPath_8to3.scala 44:39]
        if (flag_reg == 2'h2) begin // @[DataPath_8to3.scala 47:42]
          state_reg <= 4'h6; // @[DataPath_8to3.scala 47:54]
        end else begin
          state_reg <= _GEN_1;
        end
      end
    end else if (4'h1 == state_reg) begin // @[DataPath_8to3.scala 42:22]
      if (FIFO_io_is_full) begin // @[DataPath_8to3.scala 51:34]
        state_reg <= 4'h1; // @[DataPath_8to3.scala 52:27]
      end else begin
        state_reg <= 4'h2; // @[DataPath_8to3.scala 54:27]
      end
    end else if (4'h2 == state_reg) begin // @[DataPath_8to3.scala 42:22]
      state_reg <= _GEN_6;
    end else begin
      state_reg <= _GEN_25;
    end
    if (reset) begin // @[DataPath_8to3.scala 39:27]
      flag_reg <= 2'h0; // @[DataPath_8to3.scala 39:27]
    end else if (!(4'h0 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
      if (!(4'h1 == state_reg)) begin // @[DataPath_8to3.scala 42:22]
        if (4'h2 == state_reg) begin // @[DataPath_8to3.scala 42:22]
          flag_reg <= 2'h1; // @[DataPath_8to3.scala 70:22]
        end else begin
          flag_reg <= _GEN_27;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  leave_2bit = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  leave_1bit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_reg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  flag_reg = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input        clock,
  input        reset,
  input        io_valid_vec_i_0,
  input        io_valid_vec_i_1,
  input        io_valid_vec_i_2,
  input        io_valid_vec_i_3,
  input        io_valid_vec_i_4,
  input        io_valid_vec_i_5,
  input        io_valid_vec_i_6,
  input        io_valid_vec_i_7,
  input  [7:0] io_data_vec_i_0,
  input  [7:0] io_data_vec_i_1,
  input  [7:0] io_data_vec_i_2,
  input  [7:0] io_data_vec_i_3,
  input  [7:0] io_data_vec_i_4,
  input  [7:0] io_data_vec_i_5,
  input  [7:0] io_data_vec_i_6,
  input  [7:0] io_data_vec_i_7,
  input  [7:0] io_prioity_vec_i_0,
  input  [7:0] io_prioity_vec_i_1,
  input  [7:0] io_prioity_vec_i_2,
  input  [7:0] io_prioity_vec_i_3,
  input  [7:0] io_prioity_vec_i_4,
  input  [7:0] io_prioity_vec_i_5,
  input  [7:0] io_prioity_vec_i_6,
  input  [7:0] io_prioity_vec_i_7,
  output       io_ready_vec_i_0,
  output       io_ready_vec_i_1,
  output       io_ready_vec_i_2,
  output       io_ready_vec_i_3,
  output       io_ready_vec_i_4,
  output       io_ready_vec_i_5,
  output       io_ready_vec_i_6,
  output       io_ready_vec_i_7,
  output [2:0] io_data_o,
  input        io_valid_o,
  output       io_ready_o
);
  wire  dataPath_Mux_io_valid_vec_0; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_1; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_2; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_3; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_4; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_5; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_6; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_vec_7; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_0; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_1; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_2; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_3; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_4; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_5; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_6; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_vec_7; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_0; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_1; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_2; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_3; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_4; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_5; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_6; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_prioity_vec_7; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_0; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_1; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_2; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_3; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_4; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_5; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_6; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_vec_7; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_valid_grant; // @[Top.scala 20:30]
  wire  dataPath_Mux_io_ready_grant; // @[Top.scala 20:30]
  wire [7:0] dataPath_Mux_io_data_grant; // @[Top.scala 20:30]
  wire  dataPath_8to3_clock; // @[Top.scala 21:31]
  wire  dataPath_8to3_reset; // @[Top.scala 21:31]
  wire  dataPath_8to3_io_handshake_i_valid; // @[Top.scala 21:31]
  wire  dataPath_8to3_io_handshake_i_ready; // @[Top.scala 21:31]
  wire [7:0] dataPath_8to3_io_data_i; // @[Top.scala 21:31]
  wire  dataPath_8to3_io_handshake_o_valid; // @[Top.scala 21:31]
  wire  dataPath_8to3_io_handshake_o_ready; // @[Top.scala 21:31]
  wire [2:0] dataPath_8to3_io_data_o; // @[Top.scala 21:31]
  DataPath_Mux dataPath_Mux ( // @[Top.scala 20:30]
    .io_valid_vec_0(dataPath_Mux_io_valid_vec_0),
    .io_valid_vec_1(dataPath_Mux_io_valid_vec_1),
    .io_valid_vec_2(dataPath_Mux_io_valid_vec_2),
    .io_valid_vec_3(dataPath_Mux_io_valid_vec_3),
    .io_valid_vec_4(dataPath_Mux_io_valid_vec_4),
    .io_valid_vec_5(dataPath_Mux_io_valid_vec_5),
    .io_valid_vec_6(dataPath_Mux_io_valid_vec_6),
    .io_valid_vec_7(dataPath_Mux_io_valid_vec_7),
    .io_data_vec_0(dataPath_Mux_io_data_vec_0),
    .io_data_vec_1(dataPath_Mux_io_data_vec_1),
    .io_data_vec_2(dataPath_Mux_io_data_vec_2),
    .io_data_vec_3(dataPath_Mux_io_data_vec_3),
    .io_data_vec_4(dataPath_Mux_io_data_vec_4),
    .io_data_vec_5(dataPath_Mux_io_data_vec_5),
    .io_data_vec_6(dataPath_Mux_io_data_vec_6),
    .io_data_vec_7(dataPath_Mux_io_data_vec_7),
    .io_prioity_vec_0(dataPath_Mux_io_prioity_vec_0),
    .io_prioity_vec_1(dataPath_Mux_io_prioity_vec_1),
    .io_prioity_vec_2(dataPath_Mux_io_prioity_vec_2),
    .io_prioity_vec_3(dataPath_Mux_io_prioity_vec_3),
    .io_prioity_vec_4(dataPath_Mux_io_prioity_vec_4),
    .io_prioity_vec_5(dataPath_Mux_io_prioity_vec_5),
    .io_prioity_vec_6(dataPath_Mux_io_prioity_vec_6),
    .io_prioity_vec_7(dataPath_Mux_io_prioity_vec_7),
    .io_ready_vec_0(dataPath_Mux_io_ready_vec_0),
    .io_ready_vec_1(dataPath_Mux_io_ready_vec_1),
    .io_ready_vec_2(dataPath_Mux_io_ready_vec_2),
    .io_ready_vec_3(dataPath_Mux_io_ready_vec_3),
    .io_ready_vec_4(dataPath_Mux_io_ready_vec_4),
    .io_ready_vec_5(dataPath_Mux_io_ready_vec_5),
    .io_ready_vec_6(dataPath_Mux_io_ready_vec_6),
    .io_ready_vec_7(dataPath_Mux_io_ready_vec_7),
    .io_valid_grant(dataPath_Mux_io_valid_grant),
    .io_ready_grant(dataPath_Mux_io_ready_grant),
    .io_data_grant(dataPath_Mux_io_data_grant)
  );
  DataPath_8to3 dataPath_8to3 ( // @[Top.scala 21:31]
    .clock(dataPath_8to3_clock),
    .reset(dataPath_8to3_reset),
    .io_handshake_i_valid(dataPath_8to3_io_handshake_i_valid),
    .io_handshake_i_ready(dataPath_8to3_io_handshake_i_ready),
    .io_data_i(dataPath_8to3_io_data_i),
    .io_handshake_o_valid(dataPath_8to3_io_handshake_o_valid),
    .io_handshake_o_ready(dataPath_8to3_io_handshake_o_ready),
    .io_data_o(dataPath_8to3_io_data_o)
  );
  assign io_ready_vec_i_0 = dataPath_Mux_io_ready_vec_0; // @[Top.scala 27:20]
  assign io_ready_vec_i_1 = dataPath_Mux_io_ready_vec_1; // @[Top.scala 27:20]
  assign io_ready_vec_i_2 = dataPath_Mux_io_ready_vec_2; // @[Top.scala 27:20]
  assign io_ready_vec_i_3 = dataPath_Mux_io_ready_vec_3; // @[Top.scala 27:20]
  assign io_ready_vec_i_4 = dataPath_Mux_io_ready_vec_4; // @[Top.scala 27:20]
  assign io_ready_vec_i_5 = dataPath_Mux_io_ready_vec_5; // @[Top.scala 27:20]
  assign io_ready_vec_i_6 = dataPath_Mux_io_ready_vec_6; // @[Top.scala 27:20]
  assign io_ready_vec_i_7 = dataPath_Mux_io_ready_vec_7; // @[Top.scala 27:20]
  assign io_data_o = dataPath_8to3_io_data_o; // @[Top.scala 34:16]
  assign io_ready_o = dataPath_8to3_io_handshake_o_ready; // @[Top.scala 35:16]
  assign dataPath_Mux_io_valid_vec_0 = io_valid_vec_i_0; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_1 = io_valid_vec_i_1; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_2 = io_valid_vec_i_2; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_3 = io_valid_vec_i_3; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_4 = io_valid_vec_i_4; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_5 = io_valid_vec_i_5; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_6 = io_valid_vec_i_6; // @[Top.scala 25:33]
  assign dataPath_Mux_io_valid_vec_7 = io_valid_vec_i_7; // @[Top.scala 25:33]
  assign dataPath_Mux_io_data_vec_0 = io_data_vec_i_0; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_1 = io_data_vec_i_1; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_2 = io_data_vec_i_2; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_3 = io_data_vec_i_3; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_4 = io_data_vec_i_4; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_5 = io_data_vec_i_5; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_6 = io_data_vec_i_6; // @[Top.scala 24:33]
  assign dataPath_Mux_io_data_vec_7 = io_data_vec_i_7; // @[Top.scala 24:33]
  assign dataPath_Mux_io_prioity_vec_0 = io_prioity_vec_i_0; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_1 = io_prioity_vec_i_1; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_2 = io_prioity_vec_i_2; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_3 = io_prioity_vec_i_3; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_4 = io_prioity_vec_i_4; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_5 = io_prioity_vec_i_5; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_6 = io_prioity_vec_i_6; // @[Top.scala 26:33]
  assign dataPath_Mux_io_prioity_vec_7 = io_prioity_vec_i_7; // @[Top.scala 26:33]
  assign dataPath_Mux_io_ready_grant = dataPath_8to3_io_handshake_i_ready; // @[Top.scala 31:33]
  assign dataPath_8to3_clock = clock;
  assign dataPath_8to3_reset = reset;
  assign dataPath_8to3_io_handshake_i_valid = dataPath_Mux_io_valid_grant; // @[Top.scala 30:40]
  assign dataPath_8to3_io_data_i = dataPath_Mux_io_data_grant; // @[Top.scala 29:29]
  assign dataPath_8to3_io_handshake_o_valid = io_valid_o; // @[Top.scala 36:40]
endmodule
