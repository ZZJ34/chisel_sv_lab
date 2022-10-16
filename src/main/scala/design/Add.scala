/*
 * A Chisel project (Adder)
 *
 */

package design

import chisel3._
import chisel3.util._

class Add extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val c = Output(UInt(8.W))
  })

  val reg = RegInit(0.U(8.W))
  reg := io.a + io.b

  io.c := reg
}

object AddMain extends App {
  println("Generating the adder Verilog HDL")
  emitVerilog(new Add(), Array("--target-dir", "verilog"))
}