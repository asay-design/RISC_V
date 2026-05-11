----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2026 18:49:36
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
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

entity ALU is
    generic (
        NUM : integer := 32
    );
    port (
        A       : in std_logic_vector (NUM - 1 downto 0);
        B       : in std_logic_vector (NUM - 1 downto 0);
        ctrl    : in std_logic_vector (1 downto 0);
        flags   : out std_logic_vector(3 downto 0);
        ALU_out : out std_logic_vector(NUM - 1 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
    signal b_s                                : std_logic_vector(NUM - 1 downto 0) := ((others => '0'));
    signal sum_s                              : std_logic_vector(NUM downto 0)     := ((others => '0'));
    signal cout_s                             : std_logic                          := '0';
    signal mux_out, mux_in0, mux_in1, mux_in2 : std_logic_vector(NUM - 1 downto 0) := (others => '0');
    signal Z, N, C, V, v0, v1, v2             : std_logic                          := '0';
begin
    -- First mux
    b_s <= B when (ctrl(0) = '0') else
        (not B);

    -- Full adder
    sum_s <= std_logic_vector(unsigned(("0" & A)) + unsigned(("0" & b_s)) + 1) when ctrl(0) = '1' else
        std_logic_vector(unsigned(("0" & A)) + unsigned(("0" & b_s)) + 0);
    cout_s  <= sum_s(NUM);
    mux_in0 <= sum_s(NUM - 1 downto 0);
    mux_in1 <= A and B;
    mux_in2 <= A or B;

    -- Second mux
    mux_proc : process (mux_in0, mux_in1, mux_in2, ctrl)
    begin
        case(ctrl) is
            when "10" =>
            mux_out <= mux_in1;
            when "11" =>
            mux_out <= mux_in2;
            when others =>
            mux_out <= mux_in0;
        end case;
    end process;

    -- Outputs 
    Z <= '1' when mux_out = (mux_out'range => '0') else
        '0';
    N       <= mux_out(NUM - 1);
    C       <= cout_s and (not ctrl(1));

    v0      <= not(ctrl(0));
    v1      <= sum_s(NUM - 1) xor A(NUM - 1);
    v2      <= ctrl(0) xnor A(NUM - 1) xnor B(NUM - 1);
    V       <= v0 and v1 and v2;

    ALU_out <= mux_out;
    flags   <= N & Z & C & V;

end Behavioral;