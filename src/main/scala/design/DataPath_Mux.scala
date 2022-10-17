package design

import chisel3._
import chisel3.util._

// 数据通道
class data_channel extends Bundle{
    val valid = Input(Bool())
    val ready = Output(Bool())
    val data = Input(UInt(8.W))
    val prioity = Input(UInt(8.W))
}

// 多路选择
class DataPath_Mux(channel_num: Int) extends Module{
    val io = IO(new Bundle{
        // Input 
        val data_channel_array = Array.fill(channel_num) {new data_channel()}
        // Output
        val valid_grant = Output(Bool())
        val ready_grant = Input(Bool())
        val data_grant = Output(UInt(8.W))
    })
}