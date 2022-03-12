# 32bit-ALU
NTUST Computer Architecture

### Part1
#### 32-bit ALU
Testbench的部分我測試的方式是按照function的方式去測試，首先去測試它的carry是否正常，再來測試 ADD是否正常，第三個測試SUB和zero是否正常，再來測試左移右移 (十進位的乘除2or乘除4)，再來測試XOR和AND的function，最後我將funct的值設0，觀察輸出並無改變ALU測試就告一段落
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/1a.PNG)

#### 32-bit Register File (Read Only)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/1b.PNG)

#### Complete ALU:
而我測試的方式很簡單，就是隨機的選暫存器做function，只有做SUB那裡有特別選出兩個一樣的值去執行，因為要觀察Zero是否正常工作，但carry的部分因為Register File裡並沒有夠大的值讓我去檢查，因此跳過那個部分
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/1c.PNG)

### Part2
#### 32-bit ALU
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2a.PNG)

#### 32-bit Multiplicand
而我 testbench的測試想法就是input一個值，寫入之後清除，再寫入一次，在下次寫入之前改變input值看output會不會改變，再來寫入訊號，改變output結果，測試結果正常
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2b.PNG)

#### 64-bit Product
Product的testbench我一開始設計是測試reset是否正常，再來reset過後依序去測試它的寫入控制是否正常，從wave去觀察，一開始輸入16進去，再來去判斷是否讀取ALU結果，我們可以從wave看到output因為strctrl的關係被寫入到output的部分
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2c1.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2c2.PNG)

#### Control
而我testbench的寫法是去測試 reset是否正常，還有lsb是0是1時，我會不會有寫入的問題，最後去找出做完的時候我的ready是否會正常跳起一個Cycle的時間，最後測試結果均正常
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2d1.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2d2.PNG)

#### 32-bits multiplier
這是這個Part的testbench，主要測試的是幾個功能，首先第一次的兩個數字都是用最大的數 (32bit全為1)，去測試乘法器在最大數相乘是否會出錯，第一次是從150ns開始，跑到1120ns結果輸出，然後結果一直維持到1670ns第二次計算開始，而第二次計算結束是在2640ns 每一次的計算都是在960ns(96個cycle)做完
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2e1.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2e2.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/2e3.PNG)

### Part3
#### 32-bit ALU
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3a.PNG)

#### 32-bit Divisor
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3b.PNG)

#### 64-bit Remainder
Remainder的testbench我的想法是去測試reset是否正常，再來觀察ozctrol這個訊號現在0或是1時發生的事情是否正確，觀察結果為正確
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3c.PNG)

#### Control
這部分的testbench我的想法是一樣先去測試reset功能是否正常，再來是隨機測試fsb是0是1時的ALU function是否有跟著對應的判斷去更改function code，測試結果為正常，最後去看它是否有判斷到執行完的訊號(Ready)，最後測試結果均為正常
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3d1.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3d2.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3d3.PNG)

#### 32-bits divider
Testbench可以觀察到一開始我在 20ns時開始用 32bit全是1的數去除以1，最後的結果在1320ns時輸出一個Cycle的ready訊號，商是32bit全是1的數，餘數為0，結果正確。第二次在1540ns時開始執行4568除以15的除法，在2840ns時輸出ready訊號，商為304餘數為 8 結果正確。兩次除法耗時皆為1300ns(130Cycle的時間)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3e1.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3e2.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3e3.PNG)
![](https://github.com/naiyu0609/32bit-ALU/tree/main/32-bitALU/3e4.PNG)
