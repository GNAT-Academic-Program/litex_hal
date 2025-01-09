with System;
with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;
with Soc; use Soc;

package Device is

   function "+" (Right : UInt32) return System.Address is
     (System'To_Address (Right));
   
   Platform_Name      : constant String  := "radiona_ulx3s";
   Clock_Frequency    : constant Integer := 50_000_000;
   Cpu_Reset_Address  : constant Integer := 16#0000_0000#;
   Cpu_Family         : constant String  := "riscv";
   Cpu_Name           : constant String  := "vexriscv";
   Cpu_Human_Name     : constant String  := "VexRiscv";
   Cpu_Nop            : constant String  := "nop";
   Cpu_Identifier     : constant String  := "litex soc on ulx3s 2024-12-16 16:18:39";
   Cpu_L2_Size        : constant Integer := 8_192;
   CSR_Data_Width     : constant Integer := 32;
   CSR_Data_Alignment : constant Integer := 32;
   Bus_Standard       : constant String  := "wishbone";
   Bus_Data_Width     : constant Integer := 32;
   Bus_Bursting       : constant Boolean := False;
   CPU_Interrupts     : constant Integer := 2;
   Timer0_Interrupt   : constant Integer := 1;
   Uart_Interrupt     : constant Integer := 1;

end Device;
