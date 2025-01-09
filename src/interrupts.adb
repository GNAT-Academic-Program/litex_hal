with Ada.Text_IO; use Ada.Text_IO;
with System.Storage_Elements; use System.Storage_Elements;

with Soc.Uart; use Soc.Uart;
with Soc; use Soc;

with RISCV.CSR; use RISCV.CSR;
with RISCV.Types; use RISCV.Types;

package body Interrupts is

   procedure Trap_Entry with
      Import, Convention => C, External_Name => "trap_entry";

   procedure Setup is
   begin
      Mtvec.Write (Unsigned_XLEN (To_Integer (Trap_Entry'Address)));
      Mie.Set_Bits (16#800#);
      IRQ_Mask.Set_Bits (2#01#); -- important, enable UART interrupt
      Mstatus.Set_Bits (2#1000#);
   end;

   procedure Isr is
   begin
      Put_Line ("Interrupt!");
      UART_Periph.EV_PENDING.rx := 1;
   end;
   
end Interrupts;