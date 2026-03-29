module tb_alu16;

reg [15:0] A;
reg [15:0] B;
reg [3:0] sel;

wire [15:0] result;
wire carry;
wire zero;
wire sign;
wire overflow;

alu16 u0 (A, B, sel, result, carry, zero, sign, overflow);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu16);

    A = 16'd10; B = 16'd5; sel = 4'b0000; #10;
    sel = 4'b0001; #10;
    sel = 4'b0010; #10;
    sel = 4'b0011; #10;
    sel = 4'b0100; #10;
    sel = 4'b0101; #10;
    sel = 4'b0110; #10;
    sel = 4'b0111; #10;

    A = 16'd25; B = 16'd25; sel = 4'b0001; #10;

    A = 16'd30000; B = 16'd10000; sel = 4'b0000; #10;

    A = 16'hFFFF; B = 16'h0001; sel = 4'b0000; #10;

    A = 16'd0; B = 16'd0; sel = 4'b0000; #10;

    $finish;

end

endmodule
