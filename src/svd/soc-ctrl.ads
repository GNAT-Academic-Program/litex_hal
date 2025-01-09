pragma Style_Checks (Off);

--  This spec has been automatically generated from csr_radio_fixed.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package SOC.CTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype RESET_soc_rst_Field is SOC.Bit;
   subtype RESET_cpu_rst_Field is SOC.Bit;

   type RESET_Register is record
      --  Write `1` to this register to reset the full SoC (Pulse Reset)
      soc_rst       : RESET_soc_rst_Field := 16#0#;
      --  Write `1` to this register to reset the CPU(s) of the SoC (Hold
      --  Reset)
      cpu_rst       : RESET_cpu_rst_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : SOC.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESET_Register use record
      soc_rst       at 0 range 0 .. 0;
      cpu_rst       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type CTRL_Peripheral is record
      RESET      : aliased RESET_Register;
      --  Use this register as a scratch space to verify that software
      --  read/write accesses to the Wishbone/CSR bus are working correctly.
      --  The initial reset value of 0x1234578 can be used to verify
      --  endianness.
      SCRATCH    : aliased SOC.UInt32;
      --  Total number of Wishbone bus errors (timeouts) since start.
      BUS_ERRORS : aliased SOC.UInt32;
   end record
     with Volatile;

   for CTRL_Peripheral use record
      RESET      at 16#0# range 0 .. 31;
      SCRATCH    at 16#4# range 0 .. 31;
      BUS_ERRORS at 16#8# range 0 .. 31;
   end record;

   CTRL_Periph : aliased CTRL_Peripheral
     with Import, Address => CTRL_Base;

end SOC.CTRL;
