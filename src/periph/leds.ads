package Leds is
   type State_T is (Off, On) with
     Size => 1;
   for State_T use (Off => 0, On => 1);
   type Led_States is array (0 .. 7) of State_T with Pack;

   function "not" (S : State_T) return State_T is 
      (if S = On then Off else On);

   procedure Reset;
   procedure Set_Led (Led : Integer; State : State_T);
   procedure Set_Leds (States : Led_States);
   procedure Flip_Led (Led : Integer);
   procedure Flip_Leds;
end Leds;