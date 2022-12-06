package design

import chisel3._
import chisel3.util._
import dataclass.data

class Top(channel_num: Int, address_width: Int) extends Module{
    val io = IO(new Bundle{
        val valid_vec_i = Input(Vec(channel_num, Bool()))
        val data_vec_i = Input(Vec(channel_num, UInt(8.W)))
        val priority_vec_i = Input(Vec(channel_num, UInt(8.W)))
        val ready_vec_i = Output(Vec(channel_num, Bool()))

        val data_o = Output(UInt(3.W))
        val valid_o = Input(Bool())
        val ready_o = Output(Bool())
    })

    // 实例化模块
    val dataPath_Mux = Module(new DataPath_Mux(channel_num))
    val dataPath_8to3 = Module(new DataPath_8to3(address_width))

    
    dataPath_Mux.io.data_vec    := io.data_vec_i
    dataPath_Mux.io.valid_vec   := io.valid_vec_i
    dataPath_Mux.io.priority_vec := io.priority_vec_i
    io.ready_vec_i :=  dataPath_Mux.io.ready_vec

    dataPath_8to3.io.data_i := dataPath_Mux.io.data_grant
    dataPath_8to3.io.handshake_i.valid := dataPath_Mux.io.valid_grant
    dataPath_Mux.io.ready_grant := dataPath_8to3.io.handshake_i.ready


    io.data_o  := dataPath_8to3.io.data_o
    io.ready_o := dataPath_8to3.io.handshake_o.ready
    dataPath_8to3.io.handshake_o.valid := io.valid_o
    
}


object TopMain extends App {
    println("Generating the Top Verilog HDL")
    emitVerilog(new Top(8, 4), Array("--target-dir", "design"))
}