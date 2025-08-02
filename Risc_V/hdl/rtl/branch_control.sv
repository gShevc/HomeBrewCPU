module branch_control (
  // Source operands
  input  logic [31:0] opr_a_i,
  input  logic [31:0] opr_b_i,

  // Branch Type
  input  logic        is_b_type_ctl_i,
  input  logic [2:0]  instr_func3_ctl_i,

  // Branch outcome
  output logic        branch_taken_o
);

  typedef enum logic[2:0]
  {
  	BEQ = 3'h0,
    BNE = 3'h1,
    BLT = 3'h4,
    BGE = 3'h5,
    BLTU = 3'h6,
    BGEU = 3'h7
  }b_type_t;

  logic [31:0] twos_compl_a;
  logic [31:0] twos_compl_b;
  logic branch_taken;
  
  assign twos_compl_a = opr_a_i[31]? (~opr_a_i+32'h1) : opr_a_i;
  assign twos_compl_b = opr_b_i[31]? (~opr_b_i+32'h1) : opr_b_i;


  
  always_comb begin
    case(instr_func3_ctl_i)
      BEQ:  branch_taken = (opr_a_i == opr_b_i);
      BNE:  branch_taken =  (opr_a_i != opr_b_i);
      BLT:  branch_taken =  (twos_compl_a < twos_compl_b)  ;
      BGE:  branch_taken = (twos_compl_a>=twos_compl_b) ;
      BLTU: branch_taken = (opr_a_i<opr_b_i) ;
      BGEU: branch_taken = (opr_a_i >=opr_b_i) ;
      default : branch_taken = 1'b0;
      endcase
  end
  
  assign branch_taken_o = is_b_type_ctl_i & branch_taken;
  
  
  
  
endmodule