LIBRARY IEEE;
use IEEE.std_logic_1164.all;


ENTITY compteur2 IS
  port(clk, clear, ud: in std_logic;
    qc: out INTEGER RANGE 0 TO 15);
END compteur2;

ARCHITECTURE behavioral OF compteur2 IS
BEGIN
  
  PROCESS (clk)
    
    VARIABLE cnt: INTEGER RANGE 0 TO 15;
    
    BEGIN
      
        
      IF (clk'EVENT AND clk = '1') THEN
          IF clear = '0' THEN
           cnt:=0;
          ELSE
             IF (ud = '0'AND cnt < 15) THEN
             cnt:= cnt + 1;
             ELSIF (ud = '1'AND cnt > 0) THEN
            cnt:= cnt - 1;
            Else
              cnt:=0;
             END IF;
   
          END IF;
        END IF;
    qc<= cnt;
 
END PROCESS;

END behavioral;
