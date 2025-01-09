with Timer0;

with System.Machine_Code; use System.Machine_Code;
with System.Storage_Elements; use System.Storage_Elements;

with Interfaces.C; use Interfaces.C;

with Soc.Uart; use Soc.Uart;
with Soc; use Soc;

package body Uart is

   Wait_Count : Natural := 0;

   procedure Init (Clk_Freq : Natural; Baud_Rate : Natural) is
   begin
      Wait_Count := (Clk_Freq / Baud_Rate) * 10;
      UART_Periph.EV_PENDING.TX := 0;
      UART_Periph.EV_PENDING.RX := 0;
      UART_Periph.EV_ENABLE.TX := 1;
      UART_Periph.EV_ENABLE.RX := 1;
   end Init;

   function Read_RX return Character is
      UART_RX_TX : UInt32 with Volatile, Address => SOC.UART.UART_Periph.RXTX'Address;
   begin
      return Character'Val (UART_RX_TX);
   end Read_RX;
   pragma Inline (Read_RX);

   procedure Write_TX (Value : UInt32) is
      UART_RX_TX : UInt32 with Volatile, Address => SOC.UART.UART_Periph.RXTX'Address;
   begin
      UART_RX_TX := Value;
   end Write_TX;

   procedure Uart_Write (C : Character) is
   begin
      Write_Tx (Character'Pos (C));
   end Uart_Write;

   procedure Put_Char (C : Interfaces.C.char) with
     Export, Convention => C, External_Name => "putchar";

   procedure Put_Char (C : Interfaces.C.char) is
   begin
      Uart_Write (Interfaces.C.To_Ada (C));
      Timer0.Sleep (Wait_Count);
   end Put_Char;

end Uart;