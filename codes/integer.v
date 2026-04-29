module des;
 reg [7:0] data1;
 reg [7:0] data2;

 initial begin
 data1 = 45; // 8-bit value
 data2 = 9; // 8-bit value

 $display ("Add + = %d", data1 + data2); // 45 + 9 = 54
 $display ("Sub - = %d", data1 - data2); // 45 - 9 = 36
 $display ("Mul * = %d", data1 * data2); // 45 * 9 = 405, truncated to 8 bits = 149
 $display ("Div / = %d", data1 / data2); // 45 / 9 = 5 (integer division)
 $display ("Mod %% = %d", data1 % data2); // 45 % 9 = 0 (no remainder)
 $display ("Pow ** = %d", data2 ** 2); // 9^2 = 81 (simulation only)
 end
endmodule

solution:
reg signed [7:0] data1;
reg signed [7:0] data2;

👉 Both are:

8-bit
Signed numbers (range: -128 to +127)
🔍 Step-by-Step Output
➤ Addition
45 + 9 = 54

✔ Fits in 8 bits → correct

➤ Subtraction
45 - 9 = 36

✔ Correct

⚠️ Important: Multiplication
45 * 9 = 405

Now here’s the key point:

👉 405 does NOT fit in 8 bits

🔹 Binary of 405:
405 = 00000001 10010101 (needs 9+ bits)

👉 But your variable is only 8 bits, so:

Lower 8 bits = 10010101

👉 Which is:

10010101 = 149 (unsigned)

But since it's signed (2’s complement):

10010101 = -107
❗ So actual result is:
Mul * = -107   // not 149

👉 This is a very common mistake

➤ Division
45 / 9 = 5

✔ Integer division → correct

➤ Modulus
45 % 9 = 0

✔ Correct

➤ Power
9 ** 2 = 81


ex 2:

data1 = -45;
data2 = 9;
🔍 3️⃣ Operation Results
➤ Addition
-45 + 9 = -36

✔ Works correctly

➤ Subtraction
-45 - 9 = -54

✔ Correct

⚠️ Multiplication (Important)
-45 * 9 = -405

👉 But 8-bit signed cannot store -405

🔹 What happens?

-405 in binary → truncated to 8 bits
Result becomes wrong due to overflow

👉 You may see some unexpected number (wrap-around)

➤ Division
-45 / 9 = -5

✔ Correct (integer division)

➤ Modulus
-45 % 9 = 0

✔ Correct (no remainder)

➤ Power
9 ** 2 = 81

✔ Same as before

🧠 4️⃣ Another Case (Both Negative)
data1 = -20;
data2 = -5;
Results:
Operation	Result
Add	-25
Sub	-15
Mul	+100
Div	+4
Mod	0

👉 Rules:

(-) × (-) = +
(-) ÷ (-) = +
