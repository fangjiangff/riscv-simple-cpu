circuit RegFiles :
  module RegFiles :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip reg_write : UInt<1>, flip rs1 : UInt<5>, flip rs2 : UInt<5>, flip rd : UInt<5>, flip w_data : SInt<64>, r_data1 : SInt<64>, r_data2 : SInt<64>}

    wire _registers_WIRE : SInt<64>[32] @[RegFiles.scala 16:36]
    _registers_WIRE[0] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[1] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[2] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[3] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[4] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[5] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[6] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[7] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[8] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[9] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[10] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[11] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[12] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[13] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[14] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[15] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[16] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[17] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[18] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[19] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[20] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[21] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[22] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[23] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[24] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[25] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[26] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[27] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[28] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[29] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[30] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    _registers_WIRE[31] <= asSInt(UInt<64>("h0")) @[RegFiles.scala 16:36]
    reg registers : SInt<64>[32], clock with :
      reset => (reset, _registers_WIRE) @[RegFiles.scala 16:28]
    registers[0] <= asSInt(UInt<1>("h0")) @[RegFiles.scala 18:18]
    io.r_data1 <= registers[io.rs1] @[RegFiles.scala 20:16]
    io.r_data2 <= registers[io.rs2] @[RegFiles.scala 21:16]
    node _T = eq(io.reg_write, UInt<1>("h1")) @[RegFiles.scala 22:23]
    when _T : @[RegFiles.scala 22:32]
      node _T_1 = neq(io.rd, UInt<1>("h0")) @[RegFiles.scala 24:20]
      when _T_1 : @[RegFiles.scala 24:36]
        registers[io.rd] <= io.w_data @[RegFiles.scala 25:30]

