module alu16(A, B, sel, result, carry, zero, sign, overflow);

input  [15:0] A, B;
input  [3:0] sel;
output reg [15:0] result;
output carry, zero, sign, overflow;

wire [15:0] sum;
wire cout;

wire [15:0] B_in;
wire cin;

// for subtraction
assign B_in = (sel == 4'b0001) ? ~B : B;
assign cin  = (sel == 4'b0001) ? 1'b1 : 1'b0;


rca16 u1 (A, B_in, cin, sum, cout);

always @(*) begin
    case(sel)
        4'b0000: result = sum;        
        4'b0001: result = sum;       
        4'b0010: result = A & B;     
        4'b0011: result = A | B;     
        4'b0100: result = A ^ B;     
        4'b0101: result = ~A;         
        4'b0110: result = A << 1;    
        4'b0111: result = A >> 1;    
        default: result = 16'b0;
    endcase
end

// flags
assign carry    = cout;
assign zero     = (result == 16'b0);
assign sign     = result[15];
assign overflow = (A[15] & B_in[15] & ~result[15]) | 
                  (~A[15] & ~B_in[15] & result[15]);

endmodule
