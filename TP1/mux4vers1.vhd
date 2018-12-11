LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
------------------------------------------
ENTITY mux4vers1 is
  port(E0, E1, E2, E3 : in std_logic;
    s : in std_logic_vector( 1 downto 0);
    Q : out std_logic);
    
END mux4vers1;
------------------------------------------
ARCHITECTURE mux4v1_a of mux4vers1 is
 begin
        with s SELECT
        
        Q<= E0 when "00", 
            E1 when "01", 
           E2 when "10", 
           E3 when "11", 
           'Z' when others;--par défaut
END mux4v1_a;