----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2019 01:57:28 PM
-- Design Name: 
-- Module Name: Labassignment6 - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Labassignment6 is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (3 downto 0);
           mode : in STD_LOGIC;
           A,B,C,D,E,F,G, Anode0,Anode1,Anode2,Anode3: out STD_LOGIC;
           Z: out STD_LOGIC_VECTOR(15 downto 0)
           );
end Labassignment6;

architecture Behavioral of Labassignment6 is
signal count : integer :=1;
signal count1 : integer :=1;
signal clock : STD_LOGIC :='0';
signal clock1k : STD_LOGIC :='0';
signal temp : STD_LOGIC_VECTOR(3 downto 0):="0000";
signal direction : bit :='1';
signal temp1 : STD_LOGIC_VECTOR(3 downto 0);
signal NUMBER : INTEGER ;
signal NUMBER2 : INTEGER:=0;
signal N: INTEGER:=0;
begin

process(clk)
begin 
if(clk'event and clk='1') then 
count <= count +1;
if (count = 50000000) then 
clock <= not clock ;
count <= 1;
end if;
end if;
end process;

process(clk)
begin 
if(clk'event and clk='1') then 
count1 <= count1 +1;
if (count1 = 50000) then 
clock1k <= not clock1k ;
count1 <= 1;
end if;
end if;
end process;

process(clock)
begin
if (clock'event and clock='1') then
if(direction='1')then
N<=N+1;
end if;
if(direction='0')then
N<=N-1;
end if;
if(N=15) then
direction<='0';
end if;
if(N=0)then
direction<='1';
end if;
if(N=0) then
    temp<= "0000";
    ELSIF(N=1) then
   temp<= "0001";
    ELSIF(N=2) then
     temp<= "0010";
 ELSIF(N=3) then
       temp<= "0011";
 ELSIF(N=4) then
         temp<= "0100";
 ELSIF(N=5) then
           temp<= "0101";
 ELSIF(N=6) then
             temp<= "0110";
 ELSIF(N=7) then
               temp<= "0111";
 ELSIF(N=8) then
                 temp<= "1000";
 ELSIF(N=9) then
                   temp<= "1001";
 ELSIF(N=10) then
                     temp<= "1010";
 ELSIF(N=11) then
                       temp<= "1011";
 ELSIF(N=12) then
                         temp<= "1100";
 ELSIF(N=13) then
                           temp<= "1101";
 ELSIF(N=14) then
                             temp<= "1110";
 ELSIF(N=15) then
                               temp<= "1111";
end if;

end if;
end process;

process(input , temp , mode)
    begin
    if (mode = '0') then temp1<=temp;
    else  temp1<=input;
    end if;
end process;

process(temp1)
     begin
    if(temp1 = "0000") then
    A<='0'; B<='0'; C<='0'; D<='0'; E<='0'; F<='0'; G<='1';NUMBER<=0;
    ELSIF(temp1 = "0001") then
    A<='1'; B<='0'; C<='0'; D<='1'; E<='1'; F<='1'; G<='1';NUMBER<=1;
    ELSIF(temp1 = "0010") then
    A<='0'; B<='0'; C<='1'; D<='0'; E<='0'; F<='1'; G<='0';NUMBER<=2;
ELSIF(temp1 = "0011") then
A<='0'; B<='0'; C<='0'; D<='0'; E<='1'; F<='1'; G<='0';NUMBER<=3;
ELSIF(temp1 = "0100") then
A<='1'; B<='0'; C<='0'; D<='1'; E<='1'; F<='0'; G<='0';NUMBER<=4;
ELSIF(temp1 = "0101") then
A<='0'; B<='1'; C<='0'; D<='0'; E<='1'; F<='0'; G<='0';NUMBER<=5;
ELSIF(temp1 = "0110") then
A<='0'; B<='1'; C<='0'; D<='0'; E<='0'; F<='0'; G<='0';NUMBER<=6;
ELSIF(temp1 = "0111") then
A<='0'; B<='0'; C<='0'; D<='1'; E<='1'; F<='1'; G<='1';NUMBER<=7;
ELSIF(temp1 = "1000") then
A<='0'; B<='0'; C<='0'; D<='0'; E<='0'; F<='0'; G<='0';NUMBER<=8;
ELSIF(temp1 = "1001") then
A<='0'; B<='0'; C<='0'; D<='0'; E<='1'; F<='0'; G<='0';NUMBER<=9;
ELSIF(temp1 = "1010") then
A<='0'; B<='0'; C<='0'; D<='1'; E<='0'; F<='0'; G<='0';NUMBER<=10;
ELSIF(temp1 = "1011") then
A<='1'; B<='1'; C<='0'; D<='0'; E<='0'; F<='0'; G<='0';NUMBER<=11;
ELSIF(temp1 = "1100") then
A<='0'; B<='1'; C<='1'; D<='0'; E<='0'; F<='0'; G<='1';NUMBER<=12;
ELSIF(temp1 = "1101") then
A<='1'; B<='0'; C<='0'; D<='0'; E<='0'; F<='1'; G<='0';NUMBER<=13;
ELSIF(temp1 = "1110") then
A<='0'; B<='1';C<='1'; D<='0'; E<='0'; F<='0'; G<='0';NUMBER<=14;
ELSIF(temp1 = "1111") then
A<='0'; B<='1'; C<='1'; D<='1'; E<='0'; F<='0'; G<='0';NUMBER<=15;
end if;
Anode0<='0';
Anode1 <='1';
Anode2 <='1';
Anode3 <='1';
end process;

process(clock1k,NUMBER)
       begin
       if(clock1k'event and clock1k='1')then
       NUMBER2<=NUMBER2+1;
       if(NUMBER>NUMBER2)then
       Z<=(others=>'1');
       else Z<=(others=>'0');
       if(NUMBER2=15) then
       NUMBER2 <=0 ;
       end if;
       end if;
       end if;
end process;       
end Behavioral;
