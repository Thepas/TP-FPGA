library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encodeurP is
	port(
			E : in std_logic_vector(6 downto 0); -- le bus d'entrée
			S : out std_logic_vector(2 downto 0) -- le code de sortie
			);
end encodeurP;

architecture encodeurP_a of encodeurP is
begin
	process(E)
		begin
			-- des valeurs par défaut sont essentielles au cas où aucun signal d'entrée n'est actif
	
			S <= (others => '-');
			
				for k in 6 downto 0 loop -- priorité aux valeurs élevées
					if E(k) = '1' then
						S <= std_logic_vector(to_unsigned(k, 3));
					exit; -- termine la boucle
				end if;
			end loop;
end process;

end encodeurP_a;