module rca16(A, B, cin, S, cout);

input  [15:0] A, B;
input  cin;
output [15:0] S;
output cout;

wire [15:0] c;

fa f0 (A[0], B[0], cin,  S[0], c[0]);

genvar i;
generate
    for(i = 1; i < 16; i = i + 1)
    begin : adder_loop
        fa f (A[i], B[i], c[i-1], S[i], c[i]);
    end
endgenerate

assign cout = c[15];

endmodule
