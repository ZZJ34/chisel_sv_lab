package design

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

// scala 随机数
import scala.util.Random._


// initial
class DataPath_8to3Tester1 extends AnyFlatSpec with ChiselScalatestTester{
    "DataPath_8to3" should "work in case1" in{
        test(new DataPath_8to3(4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){dut =>
            dut.clock.step(20)
        }
    }
}