module clk_div (
    input  logic clk,
    input  logic rst_n,
    output logic clk_out
);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      clk_out <= 1'b0;
    else 
      clk_out <= ~clk_out;
    
  end

endmodule
