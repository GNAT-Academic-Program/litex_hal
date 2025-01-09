with System;
with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;
with Soc; use Soc;

package Device is
 

   --  type Bool is (F, T) with
   --    Size => 1;
   --  for Bool use (F => 0, T => 1);

   --  subtype U32 is Hal.UInt32;

   function "+" (Right : UInt32) return System.Address is
     (System'To_Address (Right));

   --  type Register_Access_Mode_T is (Ro, Rw) with size => 32;

   --  type Register_Descriptor_T is record
   --     Address     : Integer_Address;
   --     Rst_Value   : U32;
   --     Access_Type : Register_Access_Mode_T;
   --  end record;

   --  MSTATUS_MIE : constant Integer_Address := 16#008#;
   --  MSTATUS     : constant Integer_Address := 16#300#;
   --  IRQ_MASK    : constant Integer_Address := 16#BC0#;
   --  IRQ_PENDING : constant Integer_Address := 16#FC0#;
   --  DCACHE_INFO : constant Integer_Address := 16#CC0#;
   
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
