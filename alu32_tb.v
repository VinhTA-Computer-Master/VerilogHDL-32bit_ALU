module tb;
  reg [31:0] A,B;
  wire [31:0] D;
  reg [3:0] S;
  reg Cin=0;
  wire Cout;
  reg check=1;
  alu a1(A,B,S,Cin,D,Cout);

  initial
  begin
    S = 4'b0000; B=$random; A=$random;
    repeat(15)
      #2 S = S+1; A=$random; B=$random;
  end

  always@(*)
  case(S)
    4'b0000: ;
    4'b0001: #1 if(D!=(A+B)) check=0;
    4'b0010: #1 if(D!=(A-B)) check=0;
    4'b0011: #1 if(D!=(A*B)) check=0;
    4'b0100: #1 if(D!=(A/B)) check=0;
    4'b0101: #1 if(D!={A[30:0],1'b0}) check=0;
    4'b0110: #1 if(D!={1'b0,A[31:1]}) check=0;
    4'b0111: #1 if(D!={A[30:0],A[31]}) check=0;
    4'b1000: #1 if(D!={A[0],A[31:1]}) check=0;
    4'b1001: #1 if(D!=(A&B)) check=0;
    4'b1010: #1 if(D!=(A|B)) check=0;
    4'b1011: #1 if(D!=(A^B)) check=0;
    4'b1100: #1 if(D!=(A~&B)) check=0;
    4'b1101: #1 if(D!=(A~|B)) check=0;
    4'b1110: #1 if(A>=B && D) check=0;
    4'b1111: #1 if(A==B && D) check=0;
  endcase
    

  initial
    #35 if(check) $display("All inputs are verified");
       	else $display("Incorrect");
  
endmodule
