with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;

with Soc; use Soc;
with Soc.Leds; use Soc.Leds;

package body Leds is

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
