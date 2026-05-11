----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2026 17:18:40
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity tb_ALU is
    -- Los testbenches no tienen puertos
end tb_ALU;

architecture behavior of tb_ALU is

    -- Parámetros del Generic
    constant NUM_TB   : integer                               := 32;

    -- Señales para conectar con la ALU
    signal A_tb       : std_logic_vector(NUM_TB - 1 downto 0) := (others => '0');
    signal B_tb       : std_logic_vector(NUM_TB - 1 downto 0) := (others => '0');
    signal ctrl_tb    : std_logic_vector(1 downto 0)          := (others => '0');
    signal flags_tb   : std_logic_vector(3 downto 0);
    signal ALU_out_tb : std_logic_vector(NUM_TB - 1 downto 0);

begin

    -- Instanciación de la Unidad Bajo Prueba (UUT)
    uut : entity work.ALU
        generic map(
            NUM => NUM_TB
        )
        port map(
            A       => A_tb,
            B       => B_tb,
            ctrl    => ctrl_tb,
            flags   => flags_tb,
            ALU_out => ALU_out_tb
        );

    -- Proceso de estímulos
    stim_proc : process
    begin
        -- Nota: Como no hay reloj en tu entidad ALU, 
        -- los cambios se aplican por retardos de tiempo.

        -- Suma simple
        A_tb    <= std_logic_vector(to_unsigned(5, NUM_TB));
        B_tb    <= std_logic_vector(to_unsigned(10, NUM_TB));
        ctrl_tb <= "00";
        wait for 5 ns;

        -- Resta resta simple + Negative
        ctrl_tb <= "01";
        wait for 5 ns;
        
        A_tb    <= std_logic_vector(to_unsigned(0, NUM_TB));
        B_tb    <= std_logic_vector(to_unsigned(0, NUM_TB));
        wait for 5 ns;
                
        A_tb    <= std_logic_vector(to_unsigned(0, NUM_TB));
        B_tb    <= std_logic_vector(to_unsigned(1, NUM_TB));
        wait for 5 ns;
                
        A_tb    <= std_logic_vector(to_unsigned(1, NUM_TB));
        B_tb    <= std_logic_vector(to_unsigned(0, NUM_TB));
        wait for 5 ns;
                
        A_tb    <= x"80000000";
        B_tb    <= x"00000001";
        wait for 5 ns;
                
        A_tb    <= x"7FFFFFFF";
        B_tb    <= x"FFFFFFFF";
        wait for 5 ns;
                
        A_tb    <= x"80000000";
        B_tb    <= x"FFFFFFFF";
        wait for 5 ns;
                
        B_tb    <= x"80000000";
        A_tb    <= x"FFFFFFFF";
        wait for 5 ns;
                
        A_tb    <= x"00000000";
        B_tb    <= x"80000000";
        wait for 5 ns;

        -- Overflow + Carry
        A_tb    <= ((((NUM_TB -1) => '0', others => '1')));
        B_tb    <= std_logic_vector(to_unsigned(1, NUM_TB));
        ctrl_tb <= "00";
        wait for 5 ns;

        -- Zero 
        A_tb    <= std_logic_vector(to_unsigned(5, NUM_TB));
        B_tb    <= std_logic_vector(to_unsigned(5, NUM_TB));
        ctrl_tb <= "01";
        wait for 5 ns;

        -- And 
        A_tb    <= x"000000FF";
        B_tb    <= x"00000001";
        ctrl_tb <= "10";
        wait for 5 ns;

        -- Or 
        ctrl_tb <= "11";
        wait for 5 ns;
        
        -- Overflow
        A_tb    <= x"FFFFFFFF";
        B_tb    <= x"00000001";
        ctrl_tb <= "00";
        wait for 5 ns;
        
                -- Overflow
        B_tb    <= x"FFFFFFFF";
        A_tb    <= x"00000001";
        ctrl_tb <= "00";
        wait for 5 ns;
        
        

        -- Finalizar simulación (opcional para algunos simuladores)
        wait;
    end process;

end behavior;