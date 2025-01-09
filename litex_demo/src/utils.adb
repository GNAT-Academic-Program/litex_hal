package body Utils is
   procedure Exit_Handler is
   begin
      loop
         null;  -- Stay in an infinite loop
      end loop;
   end Exit_Handler;

   procedure Isr is
   begin
      null;
   end Isr;
end Utils;