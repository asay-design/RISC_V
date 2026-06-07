----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2026 20:40:57
-- Design Name: 
-- Module Name: register_file - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--> Simple 32 x 32 (default) register file with two read ports and one write port. 
--> Address 0 has a 0 hardwired to simplify operations.
--> Read operations are asynchronous.
--> TBD collision protection
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    generic (
        ADDR_LEN   : integer := 5;
        WORD_WIDTH : integer := 32
    );
    port (
        clk  : in std_logic;
        wen  : in std_logic;
        AR_1 : in std_logic_vector(ADDR_LEN - 1 downto 0);
        AR_2 : in std_logic_vector(ADDR_LEN - 1 downto 0);
        AW   : in std_logic_vector(ADDR_LEN - 1 downto 0);
        DW   : in std_logic_vector(WORD_WIDTH - 1 downto 0);
        DR_1 : out std_logic_vector(WORD_WIDTH - 1 downto 0);
        DR_2 : out std_logic_vector(WORD_WIDTH - 1 downto 0)

    );
end register_file;

architecture Behavioral of register_file is
    type mem_t is array ((2 ** ADDR_LEN - 1) downto 0) of std_logic_vector(WORD_WIDTH - 1 downto 0);
    signal mem : mem_t := (others => (others => '0'));
begin
    process (clk)
    begin
        if (rising_edge(clk)) then
            if (wen = '1') then
                mem(to_integer(unsigned(AW))) <= DW;
            end if;
        end if;
    end process;

    process (AR_1)
    begin
        if (AR_1 = (AR_1'range => '0')) then
            DR_1 <= (others    => '0');
        else
            DR_1 <= mem(to_integer(unsigned(AR_1)));
        end if;
    end process;

    process (AR_2)
    begin
        if (AR_2 = (AR_2'range => '0')) then
            DR_2 <= (others    => '0');
        else
            DR_2 <= mem(to_integer(unsigned(AR_2)));
        end if;
    end process;
end Behavioral;