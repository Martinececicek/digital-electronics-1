# Lab 2: Martin Zárecký

0. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

   | **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   |  0 | 0 0 | 0 0 | 0 | 1 | 0 |
   |  1 | 0 0 | 0 1 | 0 | 0 | 1 |
   |  2 | 0 0 | 1 0 | 0 | 0 | 1 |
   |  3 | 0 0 | 1 1 | 0 | 0 | 1 |
   |  4 | 0 1 | 0 0 | 1 | 0 | 0 |
   |  5 | 0 1 | 0 1 | 0 | 1 | 0 |
   |  6 | 0 1 | 1 0 | 0 | 0 | 1 |
   |  7 | 0 1 | 1 1 | 0 | 0 | 1 |
   |  8 | 1 0 | 0 0 | 1 | 0 | 0 |
   |  9 | 1 0 | 0 1 | 1 | 0 | 0 |
   | 10 | 1 0 | 1 0 | 0 | 1 | 0 |
   | 11 | 1 0 | 1 1 | 0 | 0 | 1 |
   | 12 | 1 1 | 0 0 | 1 | 0 | 0 |
   | 13 | 1 1 | 0 1 | 1 | 0 | 0 |
   | 14 | 1 1 | 1 0 | 1 | 0 | 0 |
   | 15 | 1 1 | 1 1 | 0 | 1 | 0 |

<a name="part0"></a>


### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:
   
   ![InkedA_greater_B_LI](https://user-images.githubusercontent.com/80918583/156251239-8ef3c4d8-928d-43e4-aa3d-735ada89ee37.jpg)

   
  


   Less than:

    ![B_Greater_A](https://user-images.githubusercontent.com/80918583/156239540-86b09935-017d-4f4b-9d18-d32ee1be493c.jpg)


2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.
   
   ![image](https://user-images.githubusercontent.com/80918583/156240117-dfa74482-7ad0-487b-8336-147004b20881.png)
   
   ![image](https://user-images.githubusercontent.com/80918583/156241282-ce3bfa44-38f2-4b77-b219-74f47519cfe2.png)



### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx16**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        report "Test case for ID input: xxxx16";
        
        -- 4. test case for last 2 ID digits --> xxxx16...
        s_d <= "0001"; s_c <= "0110"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_D_greater_C = '0') and
                (s_D_equals_C  = '0') and
                (s_D_less_C    = '1'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Id input combination 0001, 0110 FAILED" severity error; 
        
      
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![image](https://user-images.githubusercontent.com/80918583/156250689-385b39aa-e10b-4333-8fbf-f0da6b9f8fbc.png)

3. Link to your public EDA Playground example:

    2-bit Comparator: https://www.edaplayground.com/x/r6xc
    
    4-bit Comparator: https://www.edaplayground.com/x/nzvW
   
