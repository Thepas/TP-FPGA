LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY div_h IS
  port(clk_in: in std_logic;
    clk_out: out std_logic);
	 
END div_h;

ARCHITECTURE behavioral OF div_h IS
BEGIN
  
  PROCESS (clk_in)
    
    VARIABLE cnt: INTEGER RANGE 0 TO 5000000;
    
    BEGIN
      
        
      IF (clk_in'EVENT AND clk_in = '1') THEN
		
			cnt:= cnt + 1;
			
			IF cnt = 2500000 THEN
			
           clk_out<='1';
			  
         ELSIF cnt = 5000000 THEN
			
          clk_out<='0';
			 cnt:= 0;
			 
			 END IF;
		END IF;
	
END PROCESS;

END behavioral;			  