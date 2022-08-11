library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;
use work.Char_Lib.all;

package Slv_Lib is
  type Slv_Ptr is access std_logic_vector;
  
  procedure Read_Hex_Line(variable Line_In: in line; variable Slv_Ptr_Out: out Slv_Ptr);
  procedure To_Line(variable Slv_Ptr_In: in Slv_Ptr; variable Line_Out: out line);
end Slv_Lib;

package body Slv_lib is
  procedure Read_Hex_Line(variable Line_In: in line; variable Slv_Ptr_Out: out Slv_Ptr) is
    variable Tmp: Slv_Ptr;
  begin
    Tmp:=new std_logic_vector'("");
    for I in Line_In.all'range loop
      Tmp:=new std_logic_vector'(Tmp.all&Hex_To_Slv(Line_In.all(I)));
    end loop;
    Slv_Ptr_Out:=Tmp;
  end Read_Hex_Line;
  
  procedure To_Line(variable Slv_Ptr_In: in Slv_Ptr; variable Line_Out: out line) is
    variable Tmp: line;
  begin
    Tmp:=new string'("");
    for I in Slv_Ptr_In'range loop
      Tmp:=new string'(Tmp.all&Sl_To_Char(Slv_Ptr_In.all(I)));
    end loop;
    Line_Out:=Tmp;
  end To_Line;
end Slv_Lib;
