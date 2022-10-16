package design

import chisel3._
import chisel3.util._

// FIFO 存储单元
class FIFO(address_width: Int) extends Module{
    val io = IO(new Bundle{
        // read port
        val data_o = Output(UInt(3.W))
        val read_en = Input(Bool())
        val is_empty = Output(Bool())
        // write port
        val data_i = Input(UInt(3.W))
        val write_en = Input(Bool())
        val is_full = Output(Bool())
    })

    // mem => sequential/synchronous-read, sequential/synchronous-write
    val ram = SyncReadMem(1 << address_width, UInt(3.W))

    // pointer
    val read_pointer = RegInit(0.U((address_width+1).W))
    val write_pointer = RegInit(0.U((address_width+1).W))

    val write_pointer_next = Wire(UInt((address_width+1).W))

    // flag
    val is_empty_reg = RegInit(true.B)
    val is_full_reg = RegInit(false.B)

    io.is_empty := is_empty_reg
    io.is_full := is_full_reg

    // flag update
    write_pointer_next := write_pointer + Mux((io.write_en && !is_full_reg), 1.U, 0.U)

    is_full_reg := Cat(~write_pointer_next(address_width), write_pointer_next(address_width-1, 0)) === read_pointer
    is_empty_reg := read_pointer === write_pointer_next

    // write data
    when(!is_full_reg && io.write_en){
        ram.write(write_pointer(address_width-1, 0), io.data_i)
        write_pointer := write_pointer + 1.U
    }

    // read data
    val data_o_reg = RegInit(0.U(3.W))
    when(!is_empty_reg && io.read_en){
        data_o_reg := ram.read(read_pointer(address_width-1, 0))
        read_pointer := read_pointer + 1.U
    }
    io.data_o := data_o_reg

}