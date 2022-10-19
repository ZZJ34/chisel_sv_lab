package design

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

// scala 随机数
import scala.util.Random._

class DataPath_MuxTester1 extends AnyFlatSpec with ChiselScalatestTester{
    "Mux" should "work in case1" in{
        test(new DataPath_Mux(4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){ dut =>

            dut.io.ready_grant.poke(true.B)

            dut.clock.step(10)

            for(j <- 0 to 10){
                for(i <- 0 until 4){
                    dut.io.prioity_vec(i).poke(((i+j)%4).U)
                    dut.io.data_vec(i).poke((i+j+4).U)
                }
                dut.clock.step(2)
            }

            dut.clock.step(10)
        }
    }
}
