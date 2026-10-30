
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LPF is
    Port(
        clk    : in  std_logic;
        run    : in  std_logic;
        data_in  : in  std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end LPF;

architecture Behavioral of LPF is

signal x0,x1,x2,x3 : unsigned(7 downto 0) := (others=>'0');
signal sum         : unsigned(9 downto 0) := (others=>'0');

begin

process(clk)
begin

    if rising_edge(clk) then

        if run='1' then

            -- Shift Register
            x3 <= x2;
            x2 <= x1;
            x1 <= x0;
            x0 <= unsigned(data_in);

            -- Accumulator
            sum <= resize(x0,10) +
                   resize(x1,10) +
                   resize(x2,10) +
                   resize(unsigned(data_in),10);

            -- Divide by 4
            data_out <= std_logic_vector(sum(9 downto 2));

        end if;

    end if;

end process;

end Behavioral;