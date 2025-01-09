with Utils;
with Device;
with Timer0;
with Leds;
with Uart;

with Soc.UART; use Soc.UART;
with Soc; use Soc;
with RISCV.Types; use RISCV.Types;

with RISCV.CSR; use RISCV.CSR;

with HAL; use HAL;

with Ada.Text_IO; use Ada.Text_IO;

with Interrupts;

procedure Main is
begin
   Interrupts.Setup;
   Uart.Init (Device.Clock_Frequency, 115200);
   Timer0.Init;
   loop
      Timer0.Sleep (Device.Clock_Frequency);
      --  Put_Line (IRQ_PENDING.Read'Image);
      --  if IRQ_PENDING.Read = 1 then
      --     IRQ_PENDING.Write (1);
      --  end if;
      --  -- Put_Line (UART_Periph.EV_PENDING.rx'Image);
      --  if UART_Periph.EV_PENDING.rx = 1 then
      --     UART_Periph.EV_PENDING.rx := 1;
      --  end if;
      Put_Line ("UOttawa");
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
