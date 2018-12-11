LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity seven_seg is
port (bcd: in signed(3 downto 0);

		seg7: out signed(6 downto 0)
		);
		
end;

----------------------------------------

architecture seven_seg_a of seven_seg is

begin 
    process (bcd)
      begin
        case bcd is
				when  "0000" => seg7 <="1000000";  -- 0
				when  "0001" => seg7 <="1111001";  -- 1
				when  "0010" => seg7 <="0100100"; -- 2
				when  "0011" => seg7 <="0110000"; -- 3
				when  "0100" => seg7 <="0011001";-- 4
				when  "0101" => seg7 <="0010010";-- 5
				when  "0110" => seg7 <="0000010"; -- 6
				when  "0111" => seg7 <="1111000"; -- 7
				when  "1000" => seg7 <="0000000"; -- 8
				when  "1001" => seg7 <="0010000"; -- 9
				when others  => seg7 <="1111111"; --tous les cas restants
				 
end case;
End process;
END seven_seg_a;

------------------------------------------