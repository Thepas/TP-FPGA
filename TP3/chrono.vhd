-- Compteur synchrone par 10 (0 à 9)
--melange sequentielle et combinatoire

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity chrono is
	port(
		clk, start , stop : in std_logic;	-- Le compteur ne s'incrémente si start = 1 // Signal d'horloge // stop pour arrêter
		raz : in std_logic;	--  remise à 0
		sec10 : out std_logic_vector(3 downto 0); -- sortie sur 4 bits contenant le digit
		sec : out std_logic_vector(3 downto 0)
	);
end chrono;

architecture chrono_a of chrono is

signal compt10 : integer range 0 to 10;
signal compt : integer range 0 to 10;

begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(raz = '1') then
			
				compt10 <= 0;
				compt <= 0;
				
			elsif(start = '1' AND stop = '0') then
			
	--comptage des secondes		
			
				if(compt10 = 9 and compt/=9) then --condition pour incrémenter 1 aux secondes
					compt10 <= 0;
					compt <= compt + 1;
				elsif(compt10/=9) then    --condition pour incrémenter 1 aux 1/10 de secondes
					compt10 <= compt10 + 1;
			
				
				
			elsif (compt=9 and compt10=9) then --conditon pour recommencer le comptage
					compt<=0;
					compt10<=0;	
			end if;
		   end if;
		end if;
	end process;

	-- Conversion des variables integer compt/compt10 en std_logic_vector de 4 bits
	
	with compt10 select
		sec10 <= "0000" when 0,
			"0001" when 1,
			"0010" when 2,
			"0011" when 3,
			"0100" when 4,
			"0101" when 5,
			"0110" when 6,
			"0111" when 7,
			"1000" when 8,
			"1001" when 9,
			"0000" when others;	-- Si au dessus de 9, on renvoie en sortie 0
			
	with compt select
		sec<= "0000" when 0,
			"0001" when 1,
			"0010" when 2,
			"0011" when 3,
			"0100" when 4,
			"0101" when 5,
			"0110" when 6,
			"0111" when 7,
			"1000" when 8,
			"1001" when 9,
			"0000" when others;
end chrono_a;