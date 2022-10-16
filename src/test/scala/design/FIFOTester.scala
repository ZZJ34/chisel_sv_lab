package design

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

// scala 随机数
import scala.util.Random._

class FIFOTester1 extends AnyFlatSpec with ChiselScalatestTester{
    "FIFO" should "work in case1" in {
        test(new FIFO(3)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){ dut =>
            // 初始状态
            dut.clock.step(20)
        }

    }
}

class FIFOTester2 extends AnyFlatSpec with ChiselScalatestTester{
    "FIFO" should "work in case2" in {
        test(new FIFO(3)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){ dut =>
            // 连续写数据
            dut.clock.step(5)

            for (data_in <- 0 to 7){  
                // 写数据
                dut.io.write_en.poke(true.B)
                dut.io.data_i.poke(data_in.U)
                dut.clock.step(1)

                // 写间隔
                dut.io.write_en.poke(false.B)
                dut.clock.step(nextInt(3))
            }

            dut.clock.step(5)
        }

    }
}