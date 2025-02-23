pragma Style_Checks (Off);

--  This spec has been automatically generated from csr_radio_fixed.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package SOC.UART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype RXTX_rxtx_Field is SOC.Byte;

   type RXTX_Register is record
      rxtx          : RXTX_rxtx_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : SOC.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXTX_Register use record
      rxtx          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TXFULL_txfull_Field is SOC.Bit;

   --  TX FIFO Full.
   type TXFULL_Register is record
      txfull        : TXFULL_txfull_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : SOC.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXFULL_Register use record
      txfull        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype RXEMPTY_rxempty_Field is SOC.Bit;

   --  RX FIFO Empty.
   type RXEMPTY_Register is record
      rxempty       : RXEMPTY_rxempty_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : SOC.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXEMPTY_Register use record
      rxempty       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype EV_STATUS_tx_Field is SOC.Bit;
   subtype EV_STATUS_rx_Field is SOC.Bit;

   --  This register contains the current raw level of the rx event trigger.
   --  Writes to this register have no effect.
   type EV_STATUS_Register is record
      --  Level of the ``tx`` event
      tx            : EV_STATUS_tx_Field := 16#0#;
      --  Level of the ``rx`` event
      rx            : EV_STATUS_rx_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : SOC.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EV_STATUS_Register use record
      tx            at 0 range 0 .. 0;
      rx            at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype EV_PENDING_tx_Field is SOC.Bit;
   subtype EV_PENDING_rx_Field is SOC.Bit;

   --  When a rx event occurs, the corresponding bit will be set in this
   --  register. To clear the Event, set the corresponding bit in this
   --  register.
   type EV_PENDING_Register is record
      --  `1` if a `tx` event occurred. This Event is triggered on a
      --  **falling** edge.
      tx            : EV_PENDING_tx_Field := 16#0#;
      --  `1` if a `rx` event occurred. This Event is triggered on a
      --  **falling** edge.
      rx            : EV_PENDING_rx_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : SOC.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EV_PENDING_Register use record
      tx            at 0 range 0 .. 0;
      rx            at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype EV_ENABLE_tx_Field is SOC.Bit;
   subtype EV_ENABLE_rx_Field is SOC.Bit;

   --  This register enables the corresponding rx events. Write a ``0`` to this
   --  register to disable individual events.
   type EV_ENABLE_Register is record
      --  Write a ``1`` to enable the ``tx`` Event
      tx            : EV_ENABLE_tx_Field := 16#0#;
      --  Write a ``1`` to enable the ``rx`` Event
      rx            : EV_ENABLE_rx_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : SOC.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EV_ENABLE_Register use record
      tx            at 0 range 0 .. 0;
      rx            at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TXEMPTY_txempty_Field is SOC.Bit;

   --  TX FIFO Empty.
   type TXEMPTY_Register is record
      txempty       : TXEMPTY_txempty_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : SOC.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEMPTY_Register use record
      txempty       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype RXFULL_rxfull_Field is SOC.Bit;

   --  RX FIFO Full.
   type RXFULL_Register is record
      rxfull        : RXFULL_rxfull_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : SOC.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXFULL_Register use record
      rxfull        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type UART_Peripheral is record
      RXTX       : aliased RXTX_Register;
      --  TX FIFO Full.
      TXFULL     : aliased TXFULL_Register;
      --  RX FIFO Empty.
      RXEMPTY    : aliased RXEMPTY_Register;
      --  This register contains the current raw level of the rx event trigger.
      --  Writes to this register have no effect.
      EV_STATUS  : aliased EV_STATUS_Register;
      --  When a rx event occurs, the corresponding bit will be set in this
      --  register. To clear the Event, set the corresponding bit in this
      --  register.
      EV_PENDING : aliased EV_PENDING_Register;
      --  This register enables the corresponding rx events. Write a ``0`` to
      --  this register to disable individual events.
      EV_ENABLE  : aliased EV_ENABLE_Register;
      --  TX FIFO Empty.
      TXEMPTY    : aliased TXEMPTY_Register;
      --  RX FIFO Full.
      RXFULL     : aliased RXFULL_Register;
   end record
     with Volatile;

   for UART_Peripheral use record
      RXTX       at 16#0# range 0 .. 31;
      TXFULL     at 16#4# range 0 .. 31;
      RXEMPTY    at 16#8# range 0 .. 31;
      EV_STATUS  at 16#C# range 0 .. 31;
      EV_PENDING at 16#10# range 0 .. 31;
      EV_ENABLE  at 16#14# range 0 .. 31;
      TXEMPTY    at 16#18# range 0 .. 31;
      RXFULL     at 16#1C# range 0 .. 31;
   end record;

   UART_Periph : aliased UART_Peripheral
     with Import, Address => UART_Base;

end SOC.UART;
