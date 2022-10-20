package design

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class TopTester1 extends AnyFlatSpec with ChiselScalatestTester{
    "Top" should "work in case1" in{
        test(new Top(8, 4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){ dut =>
            dut.clock.step(10)
        }
    }
}
