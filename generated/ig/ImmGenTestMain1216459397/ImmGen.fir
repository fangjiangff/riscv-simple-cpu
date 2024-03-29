circuit ImmGen :
  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip instruction : UInt<32>, i_imm : SInt<64>, s_imm : SInt<64>, b_imm : SInt<64>, u_imm : SInt<64>, j_imm : SInt<64>}

    node i_imm_12 = bits(io.instruction, 31, 20) @[ImmGen.scala 15:34]
    node _i_imm_32_T = bits(i_imm_12, 11, 11) @[ImmGen.scala 16:41]
    node _i_imm_32_T_1 = bits(_i_imm_32_T, 0, 0) @[Bitwise.scala 74:15]
    node _i_imm_32_T_2 = mux(_i_imm_32_T_1, UInt<52>("hfffffffffffff"), UInt<52>("h0")) @[Bitwise.scala 74:12]
    node i_imm_32 = cat(_i_imm_32_T_2, i_imm_12) @[Cat.scala 31:58]
    node _io_i_imm_T = asSInt(i_imm_32) @[ImmGen.scala 17:26]
    io.i_imm <= _io_i_imm_T @[ImmGen.scala 17:14]
    node s_lower_half = bits(io.instruction, 11, 7) @[ImmGen.scala 20:38]
    node s_upper_half = bits(io.instruction, 31, 25) @[ImmGen.scala 21:38]
    node s_imm_12 = cat(s_upper_half, s_lower_half) @[Cat.scala 31:58]
    node _s_imm_64_T = bits(s_imm_12, 11, 11) @[ImmGen.scala 23:41]
    node _s_imm_64_T_1 = bits(_s_imm_64_T, 0, 0) @[Bitwise.scala 74:15]
    node _s_imm_64_T_2 = mux(_s_imm_64_T_1, UInt<52>("hfffffffffffff"), UInt<52>("h0")) @[Bitwise.scala 74:12]
    node s_imm_64 = cat(_s_imm_64_T_2, s_imm_12) @[Cat.scala 31:58]
    node _io_s_imm_T = asSInt(s_imm_64) @[ImmGen.scala 24:26]
    io.s_imm <= _io_s_imm_T @[ImmGen.scala 24:14]
    node sb_lower_half = bits(io.instruction, 11, 8) @[ImmGen.scala 27:39]
    node sb_upper_half = bits(io.instruction, 30, 25) @[ImmGen.scala 28:39]
    node sb_11thbit = bits(io.instruction, 7, 7) @[ImmGen.scala 29:36]
    node sb_12thbit = bits(io.instruction, 31, 31) @[ImmGen.scala 30:36]
    node sb_imm_13_lo_lo = asUInt(asSInt(UInt<1>("h0"))) @[Cat.scala 31:58]
    node sb_imm_13_lo = cat(sb_lower_half, sb_imm_13_lo_lo) @[Cat.scala 31:58]
    node sb_imm_13_hi_hi = cat(sb_12thbit, sb_11thbit) @[Cat.scala 31:58]
    node sb_imm_13_hi = cat(sb_imm_13_hi_hi, sb_upper_half) @[Cat.scala 31:58]
    node sb_imm_13 = cat(sb_imm_13_hi, sb_imm_13_lo) @[Cat.scala 31:58]
    node _sb_imm_64_T = bits(sb_imm_13, 12, 12) @[ImmGen.scala 32:43]
    node _sb_imm_64_T_1 = bits(_sb_imm_64_T, 0, 0) @[Bitwise.scala 74:15]
    node _sb_imm_64_T_2 = mux(_sb_imm_64_T_1, UInt<51>("h7ffffffffffff"), UInt<51>("h0")) @[Bitwise.scala 74:12]
    node _sb_imm_64_T_3 = cat(_sb_imm_64_T_2, sb_imm_13) @[Cat.scala 31:58]
    node sb_imm_64 = asSInt(_sb_imm_64_T_3) @[ImmGen.scala 32:61]
    io.b_imm <= sb_imm_64 @[ImmGen.scala 33:14]
    node u_imm_20 = bits(io.instruction, 31, 12) @[ImmGen.scala 36:34]
    node _u_imm_64_T = bits(u_imm_20, 19, 19) @[ImmGen.scala 37:41]
    node _u_imm_64_T_1 = bits(_u_imm_64_T, 0, 0) @[Bitwise.scala 74:15]
    node _u_imm_64_T_2 = mux(_u_imm_64_T_1, UInt<44>("hfffffffffff"), UInt<44>("h0")) @[Bitwise.scala 74:12]
    node u_imm_64 = cat(_u_imm_64_T_2, u_imm_20) @[Cat.scala 31:58]
    node u_imm_64_shifted = dshl(u_imm_64, UInt<4>("hc")) @[ImmGen.scala 39:37]
    node _io_u_imm_T = asSInt(u_imm_64_shifted) @[ImmGen.scala 40:34]
    io.u_imm <= _io_u_imm_T @[ImmGen.scala 40:14]
    node uj_lower_half = bits(io.instruction, 30, 21) @[ImmGen.scala 43:39]
    node uj_11thbit = bits(io.instruction, 20, 20) @[ImmGen.scala 44:36]
    node uj_upper_half = bits(io.instruction, 19, 12) @[ImmGen.scala 45:39]
    node uj_20thbit = bits(io.instruction, 31, 31) @[ImmGen.scala 46:36]
    node uj_imm_21_lo_lo = asUInt(asSInt(UInt<1>("h0"))) @[Cat.scala 31:58]
    node uj_imm_21_lo = cat(uj_lower_half, uj_imm_21_lo_lo) @[Cat.scala 31:58]
    node uj_imm_21_hi_hi = cat(uj_20thbit, uj_upper_half) @[Cat.scala 31:58]
    node uj_imm_21_hi = cat(uj_imm_21_hi_hi, uj_11thbit) @[Cat.scala 31:58]
    node uj_imm_21 = cat(uj_imm_21_hi, uj_imm_21_lo) @[Cat.scala 31:58]
    node _uj_imm_64_T = bits(uj_imm_21, 20, 20) @[ImmGen.scala 48:43]
    node _uj_imm_64_T_1 = bits(_uj_imm_64_T, 0, 0) @[Bitwise.scala 74:15]
    node _uj_imm_64_T_2 = mux(_uj_imm_64_T_1, UInt<43>("h7ffffffffff"), UInt<43>("h0")) @[Bitwise.scala 74:12]
    node uj_imm_64 = cat(_uj_imm_64_T_2, uj_imm_21) @[Cat.scala 31:58]
    node _io_j_imm_T = asSInt(uj_imm_64) @[ImmGen.scala 49:27]
    io.j_imm <= _io_j_imm_T @[ImmGen.scala 49:14]

