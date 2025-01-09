with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;

with soc; use soc;
with soc.timer0; use soc.timer0;

package body Timer0 is

   procedure Init is
   begin
      TIMER0_Periph.Load := 0;
      TIMER0_Periph.Reload := 0;
      TIMER0_Periph.EN.En := 0;
      TIMER0_Periph.Update_Value.update_value := 0;
      TIMER0_Periph.EV_PENDING.zero := 0;
      TIMER0_Periph.EV_ENABLE.zero := 0;
   end Init;

   procedure Sleep (Clk_Cycles : Natural) is
   begin
      TIMER0_Periph.Load := UInt32 (Clk_Cycles);
      TIMER0_Periph.EN.En := 1;
      loop  
         TIMER0_Periph.Update_Value.update_value := 1;
         exit when TIMER0_Periph.Value = 0;
      end loop;
      TIMER0_Periph.EN.En := 0;
   end Sleep;

end Timer0;
