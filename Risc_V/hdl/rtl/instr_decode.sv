module decode(

  input   logic  [31:0]  instr_i,
  output  logic [4:0]   rs1_o,
  output  logic [4:0]   rs2_o,
  output  logic [4:0]   rd_o,
  output  logic [6:0]   op_o,
  output  logic [2:0]   funct3_o,
  output  logic [6:0]   funct7_o,
  output  logic [31:0]  instr_imm_o
);
  
//This module is used to decode the different fields of the risc v instruction    
  assign funct7_o = instr_i[31:25];
  assign rs2_o = instr_i[24:20];
  assign rs1_o = instr_i[19:15];
  assign funct3_o = instr_i[14:12];
  assign rd_o = instr_i[11:7];
  assign op_o = instr_i[6:0];
            
  
endmodule