
import chisel3._
import chisel3.util._

class ImmGen extends Module{
    val io = IO(new Bundle{
        val instruction = Input(UInt(32.W))
        val i_imm = Output(SInt(64.W))
        val s_imm = Output(SInt(64.W))
        val b_imm = Output(SInt(64.W))
    })
    // ----- Calculating I-Immediate ------ //
    val i_imm_12 = io.instruction(31, 20)
    val i_imm_32 = Cat(Fill(52, i_imm_12(11)), i_imm_12)
    io.i_imm := i_imm_32.asSInt
    
    // ----- Calculating S-Immediate ------ //
    val s_lower_half = io.instruction(11,7)     // bits 7-11 from 32 bits
    val s_upper_half = io.instruction(31,25)    // bits 25-31 from 32 bits
    var s_imm_12 = Cat(s_upper_half, s_lower_half)    // merging immediates together to form 12 bits
    val s_imm_64 = Cat(Fill(52, s_imm_12(11)), s_imm_12)   // sign extending 12 bits to 32 bits and merging the 12 bit immediate 
    io.s_imm := s_imm_64.asSInt    
    // ----- Calculating B-Immediate ------ //
    val sb_lower_half = io.instruction(11,8)
    val sb_upper_half = io.instruction(30, 25)
    val sb_11thbit = io.instruction(7)
    val sb_12thbit = io.instruction(31)
    val sb_imm_13 = Cat(sb_12thbit, sb_11thbit, sb_upper_half, sb_lower_half, 0.S)
    val sb_imm_64 = Cat(Fill(51, sb_imm_13(12)), sb_imm_13).asSInt
    io.b_imm := sb_imm_64.asSInt
}

object ImmGenMain extends App {
  println("Generating the ImmGen hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new ImmGen(), Array("--target-dir", "generated/ig/v"))
}
