package design

import chisel3._
import chisel3.util._
import dataclass.data

// 一次输入的 prioity 互不相同
// 多路选择
class DataPath_Mux(channel_num: Int) extends Module{
    val io = IO(new Bundle{
        // Input 
        val valid_vec = Input(Vec(channel_num, Bool()))
        val data_vec = Input(Vec(channel_num, UInt(8.W)))
        val prioity_vec = Input(Vec(channel_num, UInt(8.W)))
        val ready_vec = Output(Vec(channel_num, Bool()))
        // Output
        val valid_grant = Output(Bool())
        val ready_grant = Input(Bool())
        val data_grant = Output(UInt(8.W))
    })

    val prioity_vec_temp = Wire(Vec(channel_num, UInt(8.W)))
    val prioity_max = Wire(UInt(8.W))

    prioity_vec_temp(0) := io.prioity_vec(0)

    for(index <- 1 until channel_num){
        prioity_vec_temp(index) := Mux(io.prioity_vec(index) > prioity_vec_temp(index-1), io.prioity_vec(index), prioity_vec_temp(index-1))
    }

    prioity_max := prioity_vec_temp(channel_num-1)

    val valid_vec_temp = Wire(Vec(channel_num+1, Bool()))
    val data_vec_temp = Wire(Vec(channel_num+1, UInt(8.W)))

    valid_vec_temp(0) := false.B
    data_vec_temp(0) := 0.U

    for(index <- 0 until channel_num){
        // 输出信号
        valid_vec_temp(index+1) := Mux(io.prioity_vec(index) === prioity_max, io.valid_vec(index), valid_vec_temp(index))
        data_vec_temp(index+1) := Mux(io.prioity_vec(index) === prioity_max, io.data_vec(index), data_vec_temp(index))
    }

    for(index <- 0 until channel_num){
        // 输入信号
        io.ready_vec(index) := Mux(io.prioity_vec(index) === prioity_max, io.ready_grant, false.B)
    }

    io.valid_grant := valid_vec_temp(channel_num)
    io.data_grant := data_vec_temp(channel_num)
}
