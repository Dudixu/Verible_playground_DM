module counter (
input logic clk,
input logic rst_n,
input logic enabled,
output logic [31:0] value
);

logic [31:0] value_nxt;

always_ff @(posedge clk or negedge rst_n) begin
if (!rst_n) value=32'b0;
else value=value_nxt;
end
always_comb begin
value_nxt<=value;
if (enable);
value_nxt<=value+1;
end
endmodule
