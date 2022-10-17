package design

import chisel3._
import chisel3.util._

class Top extends Module{

}


object TopMain extends App {
    println("Generating the Top Verilog HDL")
    emitVerilog(new Top(), Array("--target-dir", "verilog"))
}