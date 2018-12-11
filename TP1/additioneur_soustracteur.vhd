library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity add_sous is
   port(OP: in std_logic;
			A, B: in std_logic_vector(3 downto 0);
			C,V: out std_logic;
			S: out std_logic_vector(3 downto 0)
			);
			
end add_sous;


architecture add_s_a of add_sous is
 
  signal tmp : std_logic_vector(4 downto 0);

begin

		process(OP, tmp, A, B)
		
			begin 
			
				if OP='0' then
					tmp <= ('0' & A) + ('0' & B);
				
				elsif OP='1' then
			
					tmp <= ('0' & A) - ('0' & B);
				
				end if;
			
			if (A(3)=B(3) AND A(3) /= tmp(3)) then
			
					V<='1';
			else
					v<='0';
			end if;
			
  end process;
  
S  <= tmp(3 downto 0);
	
C <= tmp(4);
			
end add_s_a;