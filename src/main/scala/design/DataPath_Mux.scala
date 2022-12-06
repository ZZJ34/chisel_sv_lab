package design

import chisel3._
import chisel3.util._
import dataclass.data

// 多路选择
class DataPath_Mux(channel_num: Int) extends Module{
    val io = IO(new Bundle{
        // Input 
        val valid_vec = Input(Vec(channel_num, Bool()))
        val data_vec = Input(Vec(channel_num, UInt(8.W)))
        val priority_vec = Input(Vec(channel_num, UInt(8.W)))
        val ready_vec = Output(Vec(channel_num, Bool()))
        // Output
        val valid_grant = Output(Bool())
        val ready_grant = Input(Bool())
        val data_grant = Output(UInt(8.W))
    })

    val index_width = log2Ceil(channel_num)

    // 拼接 valid + priority + index
    val cat_vec_in = Wire(Vec(channel_num, UInt((1+8+index_width).W)))
     
    for(index <- 0 until channel_num){
        cat_vec_in(index) := Cat(io.valid_vec(index), io.priority_vec(index), (channel_num-index-1).U(index_width.W))
    }


    // 保存中间的比较结果
    val cat_vec_temp = Wire(Vec(channel_num, UInt((1+8+log2Ceil(channel_num)).W)))
    // 比较结果
    val result = Wire(UInt((1+8+log2Ceil(channel_num)).W))

    cat_vec_temp(0) := cat_vec_in(0)   

    for(index <- 1 until channel_num){
        cat_vec_temp(index) := Mux(cat_vec_in(index) > cat_vec_temp(index-1), cat_vec_in(index), cat_vec_temp(index-1))
    }

    result := cat_vec_temp(channel_num-1)

    io.valid_grant := false.B
    io.data_grant := 0.U

    for(index <- 0 until channel_num){
        when(result(log2Ceil(channel_num)-1, 0) === (channel_num-index-1).U){
            io.valid_grant := io.valid_vec(index)
            io.data_grant := io.data_vec(index)
        }
    }

    // 输入信号
    for(index <- 0 until channel_num){
        io.ready_vec(index) := Mux(result(log2Ceil(channel_num)-1, 0) === (channel_num-index-1).U, io.ready_grant, false.B)
    }
}
