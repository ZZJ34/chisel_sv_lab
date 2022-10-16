package design

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FIFOTester1 extends AnyFlatSpec with ChiselScalatestTester{
    "FIFO" should "work in case1" in {
        test(new FIFO(3)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){ dut =>
            // 初始状态
            dut.clock.step(20)
        }

    }
}