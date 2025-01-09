with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;

with Soc; use Soc;
with Soc.Leds; use Soc.Leds;

package body Leds is
   
   --  type Leds_Register_T is (Output);

   --  type Output_Reg_T is record
   --     Leds     : Led_States;
   --     Reserved : U24;
   --  end record with size => U32'Size;

   --  for Output_Reg_T use record
   --     Leds  at 0 range 0 .. 7;
   --     Reserved at 1 range 0 .. 23;
   --  end record;

   --  type Leds_Registers_T is array (Leds_Register_T) of Register_Descriptor_T;
   --  Leds_Registers : constant Leds_Registers_T :=
   --    (Output      => (Address     => 16#F000_1000#, 
   --                     Rst_Value   => 16#0000_0000#, 
   --                     Access_Type => Rw));

   --  Output_Reg : Output_Reg_T with Address => To_Address (16#F000_1000#);

   Leds : Led_States with Address => LEDS_Periph.OUT_k'Address;
   
   procedure Reset is
      Reset_Reg : Byte with Address => Leds'Address;
   begin
      Reset_Reg := 16#0000_0000#;
   end Reset;

   procedure Set_Led (Led : Integer; State : State_T) is
   begin 
      Leds (Led) := State;
   end Set_Led;

   procedure Set_Leds (States : Led_States) is
   begin
      Leds := States;
   end Set_Leds;

   procedure Flip_Led (Led : Integer) is
      State : State_T := Leds (Led);
   begin
      Leds (Led) := not State;
   end Flip_Led;

   procedure Flip_Leds is
   begin
      Leds := (for I in Led_States'Range => not Leds (I));
   end Flip_Leds;

end Leds;
