LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY compteur IS
  port(clk, clear: in std_logic;
    qc: out INTEGER RANGE 0 TO 15);
END compteur;

ARCHITECTURE behavioral OF compteur IS
BEGIN

PROCESS (clk)
  
  VARIABLE cnt: INTEGER RANGE 0 TO 15;
  
BEGIN 
      
        IF (clk 'EVENT AND clk = '1') THEN
                IF clear = '0' THEN
                        cnt:= 0;
                ELSE 
                  --IF cnt<15 THEN
                        cnt:= cnt+1;
                  --ELSE 
                 --  cnt:= 0;
                 -- END IF;
                END IF;
         END IF;
			
         qc<= cnt;
         
        END PROCESS;
        
END behavioral;
