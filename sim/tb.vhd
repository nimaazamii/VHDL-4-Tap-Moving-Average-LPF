
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Lpf IS
END Tb_Lpf;
 
ARCHITECTURE behavior OF Tb_Lpf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LPF
    PORT(
         clk : IN  std_logic;
         run : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal run : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 63 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LPF PORT MAP (
          clk => clk,
          run => run,
          data_in => data_in,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      run <= '1';

		data_in <= x"10"; --0x10 = 16dec
		wait for 63 ns;

		data_in <= x"20";
		wait for 63 ns;

		data_in <= x"30";
		wait for 63 ns;

		data_in <= x"40";
		wait for 63 ns;

		data_in <= x"50";
		wait for 63 ns;

      -- insert stimulus here 

      wait;
   end process;

END;