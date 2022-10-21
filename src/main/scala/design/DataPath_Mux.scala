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

    val prioity_vec_in = Wire(Vec(channel_num, UInt(8.W)))
    // 若通道 valid=0 ， 认定权重为 0 
    for(index <- 0 until channel_num){
        prioity_vec_in(index) := Mux(io.valid_vec(index), io.prioity_vec(index), 0.U)
    }


    // 保存中间的比较结果
    val prioity_vec_temp = Wire(Vec(channel_num, UInt(8.W)))
    // 最大权重
    val prioity_max = Wire(UInt(8.W))

    prioity_vec_temp(0) := prioity_vec_in(0)   

    for(index <- 1 until channel_num){
        prioity_vec_temp(index) := Mux(prioity_vec_in(index) > prioity_vec_temp(index-1), io.prioity_vec(index), prioity_vec_temp(index-1))
    }

    prioity_max := prioity_vec_temp(channel_num-1)

    io.valid_grant := false.B
    io.data_grant := 0.U

    for(index <- 0 until channel_num){
        when((prioity_vec_in(index) === prioity_max) & io.valid_vec(index)){
            io.valid_grant := io.valid_vec(index)
            io.data_grant := io.valid_vec(index)
        }
    }

    // 输入信号
    for(index <- 0 until channel_num){
        io.ready_vec(index) := Mux((prioity_vec_in(index) === prioity_max) & io.valid_vec(index), io.ready_grant, false.B)
    }
}
