```verilog
module number_format_tb;

  // Variables
  reg  [7:0]  a, b;
  reg  [3:0]  small;
  reg  signed [5:0] s1;
  integer i;

  initial begin
    $display("===== NUMBER FORMAT TESTS =====");

    // -------------------------------------------------
    // 1. Different Base Representations
    // -------------------------------------------------
    a = 8'b1111_0000;
    b = 8'hF0;
    $display("Binary vs Hex: a=%0d b=%0d", a, b);

    // -------------------------------------------------
    // 2. Sized vs Unsized
    // -------------------------------------------------
    a = 16; // unsized decimal
    $display("Unsized 16 stored in 8-bit = %0d", a);

    a = 8'd16;
    $display("Sized 8'd16 = %0d", a);

    // -------------------------------------------------
    // 3. Width Truncation
    // -------------------------------------------------
    small = 5'b10101; // 5-bit into 4-bit
    $display("Truncation (5'b10101 -> 4-bit) = %b", small);

    // -------------------------------------------------
    // 4. Overflow Case
    // -------------------------------------------------
    a = 8'd300;
    $display("Overflow 300 in 8-bit = %0d (%b)", a, a);

    // -------------------------------------------------
    // 5. Signed Numbers
    // -------------------------------------------------
    s1 = -6'd3;
    $display("Signed -3 (6-bit) = %b", s1);

    s1 = -6'sd9;
    $display("Signed -9 (6-bit signed) = %b", s1);

    // -------------------------------------------------
    // 6. X and Z values
    // -------------------------------------------------
    small = 4'b10x1;
    $display("With X = %b", small);

    small = 4'b1z01;
    $display("With Z = %b", small);

    // -------------------------------------------------
    // 7. Equality vs Case Equality
    // -------------------------------------------------
    if (4'b10x1 == 4'b1001)
      $display("== TRUE");
    else
      $display("== FALSE or UNKNOWN");

    if (4'b10x1 === 4'b1001)
      $display("=== TRUE");
    else
      $display("=== FALSE");

    // -------------------------------------------------
    // 8. Default 32-bit behavior
    // -------------------------------------------------
    i = 'hFF;
    $display("Unsized hex stored in integer = %h", i);

    // -------------------------------------------------
    // 9. Mixed Assignments
    // -------------------------------------------------
    a = 8'hFF;
    small = a; // 8-bit to 4-bit
    $display("8-bit to 4-bit = %b", small);

    // -------------------------------------------------
    // 10. Equivalent Representations
    // -------------------------------------------------
    if (4'hA == 4'd10 && 4'd10 == 4'b1010)
      $display("All representations equal");

    $display("===== END =====");
    $finish;
  end

endmodule
```
===== NUMBER FORMAT TESTS =====
Binary vs Hex: a=240 b=240
Unsized 16 stored in 8-bit = 16
Sized 8'd16 = 16
Truncation (5'b10101 -> 4-bit) = 0101
Overflow 300 in 8-bit = 44 (00101100)
Signed -3 (6-bit) = 111101
Signed -9 (6-bit signed) = 110111
With X = 10x1
With Z = 1z01
== FALSE or UNKNOWN
=== FALSE
Unsized hex stored in integer = ff
8-bit to 4-bit = 1111
All representations equal
===== END =====
