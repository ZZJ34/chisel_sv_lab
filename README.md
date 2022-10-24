# chisel_sv_lab

See the `Makefile` for the HDL code and test targets.

See the `build.sbt` for chisel vesrion and scala version.

使用 chisel 进行设计生成 RTL 代码

使用 systemVerilog 进行测试仿真

## 设计

1. FIFO（FIFO.scala） 深度可配置的 3-bit 位宽存储，读写使能，空满指示信号
   
2. 8to3（DataPath_8to3.scala） 将输入的 8-bit 数据转换为 3-bit 数据，时序逻辑，状态机控制 FIFO 的读写

3. Mux（DataPath_Mux.scala） 选择最大权重的通道，通道数可配置，组合逻辑

## 测试

1. top_warapper.v  对 chisel 产生的 verilog 代码进行端口封装

2. top_if_warapper.v 使用 interface 对 top_warapper.v 进行封装

3. test_if.sv interface 定义

4. test_task.sv 测试数据类定义，测试 task 定于

5. test_bench.sv 测试平台顶层
