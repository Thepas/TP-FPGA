LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


ENTITY compteur3 IS
 -- GENERIC (val: INTEGER := 10);
  port(clk, clear, load, ud: in std_logic;
		--val: in std_logic_vector(3 downto 0);
    qc: out std_logic_vector(3 downto 0));
  
END compteur3;

ARCHITECTURE behavioral OF compteur3 IS
signal cnt : integer range 0 to 15;
BEGIN
  
  PROCESS (clk, clear, ud, load)
    
    BEGIN
      
        
      IF (clk'EVENT AND clk = '1') THEN
        
        IF load = '1' THEN
          cnt<= 10;
          
        ELSIF load = '0' THEN
          
                  IF clear = '0' THEN
                  cnt<=0;
                  
                  ELSIF clear = '1' THEN
           
                      IF (ud = '0') THEN
									cnt<= cnt + 1;
								if (cnt > 15) then
									cnt<=0;
								end if;
                      ELSE
                         IF cnt > 0 THEN
                          cnt<= cnt - 1;
                          ELSE 
                          cnt<=0;
                          END IF;
                       END IF;
   
                  END IF;
        END IF;
  END IF;-- Conversion de la valeur de la variable integer compt en std_logic_vector de 4 bits
 
END PROCESS;
	with cnt select
		qc <= "0000" when 0,
			"0001" when 1,
			"0010" when 2,
			"0011" when 3,
			"0100" when 4,
			"0101" when 5,
			"0110" when 6,
			"0111" when 7,
			"1000" when 8,
			"1001" when 9,
			"1010" when 10,
			"1011" when 11,
			"1100" when 12,
			"1101" when 13,
			"1110" when 14,
			"1111" when 15,
			"0000" when others;
END behavioral;
