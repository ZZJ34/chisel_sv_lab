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

// write one data and read one data
class DataPath_8to3Tester2 extends AnyFlatSpec with ChiselScalatestTester{
    "DataPath_8to3" should "work in case2" in{
        test(new DataPath_8to3(4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){dut =>
            dut.clock.step(4)

            dut.io.handshake_i.valid.poke(true.B)
            dut.io.data_i.poke(34.U)

            while(!dut.io.handshake_i.ready.peek().litToBoolean){ dut.clock.step() }

            dut.io.handshake_i.valid.poke(false.B)

            dut.clock.step(4)

            dut.io.handshake_o.valid.poke(true.B)
            dut.clock.step()
            while(!dut.io.handshake_o.ready.peek().litToBoolean){ dut.clock.step() }
            dut.io.handshake_o.valid.poke(false.B)

            dut.clock.step(4)
        }
    }
}

// write data
class DataPath_8to3Tester3 extends AnyFlatSpec with ChiselScalatestTester{
    "DataPath_8to3" should "work in case3" in{
        test(new DataPath_8to3(4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){dut =>
            dut.clock.step(4)

            for(i <- 1 to 6){
                dut.io.handshake_i.valid.poke(true.B)
                dut.io.data_i.poke(nextInt(34).U)

                while(!dut.io.handshake_i.ready.peek().litToBoolean){ dut.clock.step() }

                dut.io.handshake_i.valid.poke(false.B)

                dut.clock.step(1)
            }

            dut.clock.step(4) 
        }
    }
}

// write data and read
class DataPath_8to3Tester4 extends AnyFlatSpec with ChiselScalatestTester{
    "DataPath_8to3" should "work in case4" in{
        test(new DataPath_8to3(4)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)){dut =>
            dut.clock.step(4)

            for(i <- 1 to 3){
                dut.io.handshake_i.valid.poke(true.B)
                dut.io.data_i.poke(nextInt(34).U)

                while(!dut.io.handshake_i.ready.peek().litToBoolean){ dut.clock.step() }

                dut.io.handshake_i.valid.poke(false.B)

                dut.clock.step(nextInt(4))
            }

            dut.clock.step(4)
            dut.io.handshake_o.valid.poke(true.B)
            dut.clock.step(4)

            for(i <- 1 to 34){
                dut.io.handshake_i.valid.poke(true.B)
                dut.io.data_i.poke(nextInt(34).U)

                while(!dut.io.handshake_i.ready.peek().litToBoolean){ dut.clock.step() }

                dut.io.handshake_i.valid.poke(false.B)

                dut.clock.step(1)
            }
        }
    }
}

// 