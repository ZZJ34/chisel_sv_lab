package design

import chisel3._
import chisel3.util._


// 握手通道
class handshake_channel extends Bundle{
    val valid = Input(Bool())
    val ready = Output(Bool())
}

// 8bit 转 3bit 数据通路
class DataPath_8to3(address_width: Int) extends Module{
    val io = IO(new Bundle{
        // 输入数据通路
        val handshake_i = new handshake_channel()
        val data_i = Input(UInt(8.W))
        // 输出数据通路
        val handshake_o = new handshake_channel()
        val data_o = Output(UInt(3.W))
    })

    val leave_2bit = RegInit(0.U(2.W))  // 剩余的 2bit
    val leave_1bit = RegInit(0.U(1.W))  // 剩余的 1bit

    val FIFO = Module(new FIFO(address_width))

    // 状态定义
    val nothing :: leave_none_1 :: leave_none_2 :: leave_2bit_1 :: leave_2bit_2 :: leave_2bit_3 :: leave_1bit_1 :: leave_1bit_2 :: leave_1bit_3 :: Nil = Enum(9)

    // flag 定义
    val none :: _2bit :: _1bit :: Nil = Enum(3)

    // 初始状态
    val state_reg = RegInit(nothing)

    // flag 寄存器
    val flag_reg = RegInit(none)
    
    // 状态切换
    switch(state_reg){
        is(nothing){
            when(io.handshake_i.valid){
                when(flag_reg === none)  { state_reg := leave_none_1 }
                when(flag_reg === _2bit) { state_reg := leave_2bit_1 }
                when(flag_reg === _1bit) { state_reg := leave_1bit_1 }
            }
        }
        is(leave_none_1){
            when(FIFO.io.is_full){
                state_reg := leave_none_1
            }.otherwise{
                state_reg := leave_none_2
            }
            
            leave_2bit := io.data_i(7,6)
        }
        is(leave_none_2){
            when(FIFO.io.is_full){
                state_reg := leave_none_2
            }.otherwise{
                when(io.handshake_i.valid){
                    state_reg := leave_2bit_1
                }.otherwise{
                    state_reg := nothing
                }
            }

            flag_reg := _2bit
        }
        is(leave_2bit_1){
            when(FIFO.io.is_full){
                state_reg := leave_2bit_1
            }.otherwise{
                state_reg := leave_2bit_2
            }

            leave_1bit := io.data_i(7)
        }
        is(leave_2bit_2){
            when(FIFO.io.is_full){
                state_reg := leave_2bit_2
            }.otherwise{
                state_reg := leave_2bit_3
            }
        }
        is(leave_2bit_3){
            when(FIFO.io.is_full){
                state_reg := leave_2bit_3
            }.otherwise{
                when(io.handshake_i.valid){
                    state_reg := leave_1bit_1
                }.otherwise{
                    state_reg := nothing
                }
            }

            flag_reg := _1bit
        }
        is(leave_1bit_1){
            when(FIFO.io.is_full){
                state_reg := leave_1bit_1
            }.otherwise{
                state_reg := leave_1bit_2
            }
        }
        is(leave_1bit_2){
            when(FIFO.io.is_full){
                state_reg := leave_1bit_2
            }.otherwise{
                state_reg := leave_1bit_3
            }
        }
        is(leave_1bit_3){
            when(FIFO.io.is_full){
                state_reg := leave_1bit_3
            }.otherwise{
                when(io.handshake_i.valid){
                    state_reg := leave_none_1
                }.otherwise{
                    state_reg := nothing
                }
            }
            
            flag_reg := none
        }
    }


    val write_en_wire = WireDefault(false.B)
    val data_i_wire = WireDefault(0.U(3.W))

    FIFO.io.write_en := write_en_wire
    FIFO.io.data_i := data_i_wire  
    // FIFO 写入数据
    switch(state_reg){
        is(leave_none_1) {
            write_en_wire := true.B
            data_i_wire := io.data_i(2, 0)
        }
        is(leave_none_2) {
            write_en_wire := true.B
            data_i_wire := io.data_i(5, 3)
        }
        is(leave_2bit_1) {
            write_en_wire := true.B
            data_i_wire := Cat(io.data_i(0), leave_2bit)
        }
        is(leave_2bit_2) {
            write_en_wire := true.B
            data_i_wire := io.data_i(3, 1)
        }
        is(leave_2bit_3) {
            write_en_wire := true.B
            data_i_wire := io.data_i(6, 4)
        }
        is(leave_1bit_1) {
            write_en_wire := true.B
            data_i_wire := Cat(io.data_i(1,0) ,leave_1bit)
        }
        is(leave_1bit_2) {
            write_en_wire := true.B
            data_i_wire := io.data_i(4,2)
        }
        is(leave_1bit_3) {
            write_en_wire := true.B
            data_i_wire := io.data_i(7,5)
        }
    }
    io.handshake_i.ready := ((state_reg === leave_none_2) || (state_reg === leave_2bit_3) || (state_reg === leave_1bit_3)) && (!FIFO.io.is_full)

    // FIFO 读出数据
    FIFO.io.read_en := io.handshake_o.valid
    io.handshake_o.ready := io.handshake_o.valid && (!FIFO.io.is_empty)
    io.data_o := FIFO.io.data_o
}