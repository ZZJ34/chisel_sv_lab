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

    val ram = Mem(1 << address_width, UInt(3.W))

    // pointer
    val read_pointer_next = Wire(UInt((address_width+1).W))
    val write_pointer_next = Wire(UInt((address_width+1).W))

    val read_pointer = RegNext(read_pointer_next, 0.U((address_width+1).W))
    val write_pointer = RegNext(write_pointer_next, 0.U((address_width+1).W))

    // flag
    val is_empty_reg = RegInit(true.B)
    val is_full_reg = RegInit(false.B)

    // pointer update
    write_pointer_next := write_pointer + Mux((io.write_en && !is_full_reg), 1.U, 0.U)
    read_pointer_next := read_pointer + Mux((io.read_en && !is_empty_reg), 1.U, 0.U)

    io.is_empty := is_empty_reg
    io.is_full := is_full_reg

    // flag update
    is_full_reg := Cat(~write_pointer_next(address_width), write_pointer_next(address_width-1, 0)) === read_pointer
    is_empty_reg := read_pointer_next === write_pointer

    // write data
    when(!is_full_reg && io.write_en){
        ram.write(write_pointer(address_width-1, 0), io.data_i)
    }

    // read data
    io.data_o := ram.read(read_pointer(address_width-1, 0))

}