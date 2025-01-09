pragma Style_Checks (Off);

--  This spec has been automatically generated from csr_radio_fixed.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package SOC.SDRAM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype DFII_CONTROL_sel_Field is SOC.Bit;
   subtype DFII_CONTROL_cke_Field is SOC.Bit;
   subtype DFII_CONTROL_odt_Field is SOC.Bit;
   subtype DFII_CONTROL_reset_n_Field is SOC.Bit;

   --  Control DFI signals common to all phases
   type DFII_CONTROL_Register is record
      --  None
      sel           : DFII_CONTROL_sel_Field := 16#1#;
      --  DFI clock enable bus
      cke           : DFII_CONTROL_cke_Field := 16#0#;
      --  DFI on-die termination bus
      odt           : DFII_CONTROL_odt_Field := 16#0#;
      --  DFI clock reset bus
      reset_n       : DFII_CONTROL_reset_n_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : SOC.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_CONTROL_Register use record
      sel           at 0 range 0 .. 0;
      cke           at 0 range 1 .. 1;
      odt           at 0 range 2 .. 2;
      reset_n       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype DFII_PI0_COMMAND_cs_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_we_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_cas_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_ras_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_wren_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_rden_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_cs_top_Field is SOC.Bit;
   subtype DFII_PI0_COMMAND_cs_bottom_Field is SOC.Bit;

   --  Control DFI signals on a single phase
   type DFII_PI0_COMMAND_Register is record
      --  DFI chip select bus
      cs            : DFII_PI0_COMMAND_cs_Field := 16#0#;
      --  DFI write enable bus
      we            : DFII_PI0_COMMAND_we_Field := 16#0#;
      --  DFI column address strobe bus
      cas           : DFII_PI0_COMMAND_cas_Field := 16#0#;
      --  DFI row address strobe bus
      ras           : DFII_PI0_COMMAND_ras_Field := 16#0#;
      --  DFI write data enable bus
      wren          : DFII_PI0_COMMAND_wren_Field := 16#0#;
      --  DFI read data enable bus
      rden          : DFII_PI0_COMMAND_rden_Field := 16#0#;
      --  DFI chip select bus for top half only
      cs_top        : DFII_PI0_COMMAND_cs_top_Field := 16#0#;
      --  DFI chip select bus for bottom half only
      cs_bottom     : DFII_PI0_COMMAND_cs_bottom_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : SOC.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_COMMAND_Register use record
      cs            at 0 range 0 .. 0;
      we            at 0 range 1 .. 1;
      cas           at 0 range 2 .. 2;
      ras           at 0 range 3 .. 3;
      wren          at 0 range 4 .. 4;
      rden          at 0 range 5 .. 5;
      cs_top        at 0 range 6 .. 6;
      cs_bottom     at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DFII_PI0_COMMAND_ISSUE_dfii_pi0_command_issue_Field is SOC.Bit;

   type DFII_PI0_COMMAND_ISSUE_Register is record
      dfii_pi0_command_issue : DFII_PI0_COMMAND_ISSUE_dfii_pi0_command_issue_Field :=
                                16#0#;
      --  unspecified
      Reserved_1_31          : SOC.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_COMMAND_ISSUE_Register use record
      dfii_pi0_command_issue at 0 range 0 .. 0;
      Reserved_1_31          at 0 range 1 .. 31;
   end record;

   subtype DFII_PI0_ADDRESS_dfii_pi0_address_Field is SOC.UInt13;

   --  DFI address bus
   type DFII_PI0_ADDRESS_Register is record
      dfii_pi0_address : DFII_PI0_ADDRESS_dfii_pi0_address_Field := 16#0#;
      --  unspecified
      Reserved_13_31   : SOC.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_ADDRESS_Register use record
      dfii_pi0_address at 0 range 0 .. 12;
      Reserved_13_31   at 0 range 13 .. 31;
   end record;

   subtype DFII_PI0_BADDRESS_dfii_pi0_baddress_Field is SOC.UInt2;

   --  DFI bank address bus
   type DFII_PI0_BADDRESS_Register is record
      dfii_pi0_baddress : DFII_PI0_BADDRESS_dfii_pi0_baddress_Field := 16#0#;
      --  unspecified
      Reserved_2_31     : SOC.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_BADDRESS_Register use record
      dfii_pi0_baddress at 0 range 0 .. 1;
      Reserved_2_31     at 0 range 2 .. 31;
   end record;

   subtype DFII_PI0_WRDATA_dfii_pi0_wrdata_Field is SOC.UInt16;

   --  DFI write data bus
   type DFII_PI0_WRDATA_Register is record
      dfii_pi0_wrdata : DFII_PI0_WRDATA_dfii_pi0_wrdata_Field := 16#0#;
      --  unspecified
      Reserved_16_31  : SOC.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_WRDATA_Register use record
      dfii_pi0_wrdata at 0 range 0 .. 15;
      Reserved_16_31  at 0 range 16 .. 31;
   end record;

   subtype DFII_PI0_RDDATA_dfii_pi0_rddata_Field is SOC.UInt16;

   --  DFI read data bus
   type DFII_PI0_RDDATA_Register is record
      dfii_pi0_rddata : DFII_PI0_RDDATA_dfii_pi0_rddata_Field := 16#0#;
      --  unspecified
      Reserved_16_31  : SOC.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFII_PI0_RDDATA_Register use record
      dfii_pi0_rddata at 0 range 0 .. 15;
      Reserved_16_31  at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SDRAM_Peripheral is record
      --  Control DFI signals common to all phases
      DFII_CONTROL           : aliased DFII_CONTROL_Register;
      --  Control DFI signals on a single phase
      DFII_PI0_COMMAND       : aliased DFII_PI0_COMMAND_Register;
      DFII_PI0_COMMAND_ISSUE : aliased DFII_PI0_COMMAND_ISSUE_Register;
      --  DFI address bus
      DFII_PI0_ADDRESS       : aliased DFII_PI0_ADDRESS_Register;
      --  DFI bank address bus
      DFII_PI0_BADDRESS      : aliased DFII_PI0_BADDRESS_Register;
      --  DFI write data bus
      DFII_PI0_WRDATA        : aliased DFII_PI0_WRDATA_Register;
      --  DFI read data bus
      DFII_PI0_RDDATA        : aliased DFII_PI0_RDDATA_Register;
   end record
     with Volatile;

   for SDRAM_Peripheral use record
      DFII_CONTROL           at 16#0# range 0 .. 31;
      DFII_PI0_COMMAND       at 16#4# range 0 .. 31;
      DFII_PI0_COMMAND_ISSUE at 16#8# range 0 .. 31;
      DFII_PI0_ADDRESS       at 16#C# range 0 .. 31;
      DFII_PI0_BADDRESS      at 16#10# range 0 .. 31;
      DFII_PI0_WRDATA        at 16#14# range 0 .. 31;
      DFII_PI0_RDDATA        at 16#18# range 0 .. 31;
   end record;

   SDRAM_Periph : aliased SDRAM_Peripheral
     with Import, Address => SDRAM_Base;

end SOC.SDRAM;
