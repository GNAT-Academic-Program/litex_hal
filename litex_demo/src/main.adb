with Utils;
with Device;
with Timer0;
with Leds;
with Uart;

with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
begin
   Uart.Init (Device.Clock_Frequency, 115200);
   Timer0.Init;
   loop
      Timer0.Sleep (Device.Clock_Frequency);
      Put_Line ("Hello from Ada!");
   end loop;
end Main;

--  procedure Main is
--     wrap : Natural := 0;
--  begin
--     -- Csr.Uart.Init (Csr.Clock_Frequency, 115200);
--     Timer0.Init;
--     Leds.Reset;
--     loop
--        Timer0.Sleep (Device.Clock_Frequency * 2);
--        Leds.Flip_Led (Natural (wrap mod 8));
--        wrap := @ + 1;
--        -- Put_Line ("Yolo from Ada!");
--        -- Csr.Irq.Irq_Attach (0, System.Null_Address);
--     end loop;
--  end Main;
