circuit Ctrl :
  module Ctrl :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inst : UInt<32>, alu_src : UInt<1>, mem_to_reg : UInt<1>, reg_write : UInt<1>, mem_read : UInt<1>, mem_write : UInt<1>, branch : UInt<1>, alu_op : UInt<2>}

    node opcode = bits(io.inst, 6, 0) @[Ctrl.scala 18:25]
    node _io_alu_src_T = bits(io.inst, 6, 6) @[Ctrl.scala 20:28]
    node _io_alu_src_T_1 = not(_io_alu_src_T) @[Ctrl.scala 20:20]
    node _io_alu_src_T_2 = bits(io.inst, 5, 5) @[Ctrl.scala 20:46]
    node _io_alu_src_T_3 = bits(io.inst, 4, 4) @[Ctrl.scala 20:59]
    node _io_alu_src_T_4 = and(_io_alu_src_T_2, _io_alu_src_T_3) @[Ctrl.scala 20:50]
    node _io_alu_src_T_5 = not(_io_alu_src_T_4) @[Ctrl.scala 20:36]
    node _io_alu_src_T_6 = and(_io_alu_src_T_1, _io_alu_src_T_5) @[Ctrl.scala 20:33]
    io.alu_src <= _io_alu_src_T_6 @[Ctrl.scala 20:16]
    node _io_mem_to_reg_T = bits(io.inst, 6, 6) @[Ctrl.scala 22:31]
    node _io_mem_to_reg_T_1 = not(_io_mem_to_reg_T) @[Ctrl.scala 22:23]
    node _io_mem_to_reg_T_2 = bits(io.inst, 5, 5) @[Ctrl.scala 22:47]
    node _io_mem_to_reg_T_3 = not(_io_mem_to_reg_T_2) @[Ctrl.scala 22:39]
    node _io_mem_to_reg_T_4 = and(_io_mem_to_reg_T_1, _io_mem_to_reg_T_3) @[Ctrl.scala 22:36]
    node _io_mem_to_reg_T_5 = bits(io.inst, 4, 4) @[Ctrl.scala 22:63]
    node _io_mem_to_reg_T_6 = not(_io_mem_to_reg_T_5) @[Ctrl.scala 22:55]
    node _io_mem_to_reg_T_7 = and(_io_mem_to_reg_T_4, _io_mem_to_reg_T_6) @[Ctrl.scala 22:52]
    io.mem_to_reg <= _io_mem_to_reg_T_7 @[Ctrl.scala 22:19]
    node _io_reg_write_T = bits(io.inst, 6, 6) @[Ctrl.scala 23:30]
    node _io_reg_write_T_1 = not(_io_reg_write_T) @[Ctrl.scala 23:22]
    node _io_reg_write_T_2 = bits(io.inst, 5, 5) @[Ctrl.scala 23:47]
    node _io_reg_write_T_3 = bits(io.inst, 4, 4) @[Ctrl.scala 23:61]
    node _io_reg_write_T_4 = not(_io_reg_write_T_3) @[Ctrl.scala 23:53]
    node _io_reg_write_T_5 = and(_io_reg_write_T_2, _io_reg_write_T_4) @[Ctrl.scala 23:51]
    node _io_reg_write_T_6 = not(_io_reg_write_T_5) @[Ctrl.scala 23:38]
    node _io_reg_write_T_7 = and(_io_reg_write_T_1, _io_reg_write_T_6) @[Ctrl.scala 23:35]
    io.reg_write <= _io_reg_write_T_7 @[Ctrl.scala 23:18]
    node _io_mem_read_T = bits(io.inst, 6, 6) @[Ctrl.scala 24:30]
    node _io_mem_read_T_1 = not(_io_mem_read_T) @[Ctrl.scala 24:22]
    node _io_mem_read_T_2 = bits(io.inst, 5, 5) @[Ctrl.scala 24:46]
    node _io_mem_read_T_3 = not(_io_mem_read_T_2) @[Ctrl.scala 24:38]
    node _io_mem_read_T_4 = and(_io_mem_read_T_1, _io_mem_read_T_3) @[Ctrl.scala 24:35]
    node _io_mem_read_T_5 = bits(io.inst, 4, 4) @[Ctrl.scala 24:62]
    node _io_mem_read_T_6 = not(_io_mem_read_T_5) @[Ctrl.scala 24:54]
    node _io_mem_read_T_7 = and(_io_mem_read_T_4, _io_mem_read_T_6) @[Ctrl.scala 24:51]
    io.mem_read <= _io_mem_read_T_7 @[Ctrl.scala 24:17]
    node _io_mem_write_T = bits(io.inst, 6, 6) @[Ctrl.scala 25:30]
    node _io_mem_write_T_1 = not(_io_mem_write_T) @[Ctrl.scala 25:22]
    node _io_mem_write_T_2 = bits(io.inst, 5, 5) @[Ctrl.scala 25:45]
    node _io_mem_write_T_3 = bits(io.inst, 4, 4) @[Ctrl.scala 25:60]
    node _io_mem_write_T_4 = not(_io_mem_write_T_3) @[Ctrl.scala 25:52]
    node _io_mem_write_T_5 = and(_io_mem_write_T_2, _io_mem_write_T_4) @[Ctrl.scala 25:49]
    node _io_mem_write_T_6 = and(_io_mem_write_T_1, _io_mem_write_T_5) @[Ctrl.scala 25:35]
    io.mem_write <= _io_mem_write_T_6 @[Ctrl.scala 25:18]
    node _io_branch_T = bits(opcode, 6, 6) @[Ctrl.scala 26:24]
    io.branch <= _io_branch_T @[Ctrl.scala 26:15]
    node _alu_op0_T = bits(io.inst, 6, 6) @[Ctrl.scala 27:27]
    node _alu_op0_T_1 = bits(io.inst, 5, 5) @[Ctrl.scala 27:42]
    node _alu_op0_T_2 = and(_alu_op0_T, _alu_op0_T_1) @[Ctrl.scala 27:32]
    node _alu_op0_T_3 = bits(io.inst, 4, 4) @[Ctrl.scala 27:58]
    node _alu_op0_T_4 = not(_alu_op0_T_3) @[Ctrl.scala 27:50]
    node alu_op0 = and(_alu_op0_T_2, _alu_op0_T_4) @[Ctrl.scala 27:47]
    node _alu_op1_T = bits(io.inst, 6, 6) @[Ctrl.scala 28:28]
    node _alu_op1_T_1 = not(_alu_op1_T) @[Ctrl.scala 28:20]
    node _alu_op1_T_2 = bits(io.inst, 4, 4) @[Ctrl.scala 28:43]
    node alu_op1 = and(_alu_op1_T_1, _alu_op1_T_2) @[Ctrl.scala 28:33]
    node _io_alu_op_T = cat(alu_op1, alu_op0) @[Cat.scala 31:58]
    io.alu_op <= _io_alu_op_T @[Ctrl.scala 30:15]

