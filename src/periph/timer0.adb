with Interfaces; use Interfaces;
with System.Storage_Elements; use System.Storage_Elements;

with soc; use soc;
with soc.timer0; use soc.timer0;

package body Timer0 is

   --  type Timer0_Register_T is
   --    (Load, 
   --     Reload, 
   --     Enable, 
   --     Update_Value, 
   --     Value, 
   --     Event_Status, 
   --     Event_Pending,
   --     Event_Enable);

   --  type Timer0_Registers_T is array (Timer0_Register_T) of Register_Descriptor_T;
   --  Timer0_Registers : constant Timer0_Registers_T :=
   --     (Load          => (+16#F000_2000#, 16#0000_0000#, Rw),
   --      Reload        => (+16#F000_2004#, 16#0000_0000#, Rw),
   --      Enable        => (+16#F000_2008#, 16#0000_0000#, Rw),
   --      Update_Value  => (+16#F000_200C#, 16#0000_0000#, Rw),
   --      Value         => (+16#F000_2010#, 16#0000_0000#, Ro),
   --      Event_Status  => (+16#F000_2014#, 16#0000_0000#, Ro),
   --      Event_Pending => (+16#F000_2018#, 16#0000_0000#, Rw),
   --      Event_Enable  => (+16#F000_201C#, 16#0000_0000#, Rw));


   --  --  In **One-Shot mode**, the Timer starts counting down from this value.
   --  --  The Timer stops when it reaches `0` and does not restart automatically.
   --  --  The value is loaded when the Timer is enabled or re-enabled.
   --  type Load_Reg_T is record
   --     Value : U32;
   --  end record with Size => 32;
   --  for Load_Reg_T use record
   --     Value at 0 range 0 .. 31;
   --  end record;

   --  --  Specifies the Timer's period in clock cycles (Periodic mode).
   --  --  When the Timer reaches `0`, it resets to this value and restarts.
   --  type Reload_Reg_T is record
   --     Value : U32;
   --  end record with Size => 32;
   --  for Reload_Reg_T use record   
   --     Value at 0 range 0 .. 31;
   --  end record;

   --  --  Set to `T` to enable/start the Timer.
   --  --  Set to `F` to disable the Timer.
   --  type Enable_Reg_T is record
   --     Value : Bool;
   --  end record with Size => 32;
   --  for Enable_Reg_T use record
   --     Value at 0 range 0 .. 0;
   --  end record;    

   --  --  Writing `T` to this register updates the `Value` register with the current countdown value.
   --  type Update_Value_Reg_T is record
   --     Value : Bool;
   --  end record with Size => 32;
   --  for Update_Value_Reg_T use record
   --     Value at 0 range 0 .. 0;
   --  end record;

   --  --  Reflects the current countdown value.
   --  --  Writing to the `update_value` register latches a new value into this register.
   --  type Value_Reg_T is record
   --     Value : U32;
   --  end record with Size => 32;
   --  for Value_Reg_T use record
   --     Value at 0 range 0 .. 31;
   --  end record;

   --  --  `T` if the event is active, `F` if inactive.
   --  type Event_Status_Reg_T is record
   --     Value : Bool;
   --  end record with Size => 32;
   --  for Event_Status_Reg_T use record
   --     Value at 0 range 0 .. 0;
   --  end record;

   --  --  'T' if a `zero` event occurred (triggered on falling edge).
   --  --  Write 'T' to clear the corresponding event.
   --  type Event_Pending_Reg_T is record
   --     Value : Bool;
   --  end record with Size => 32;
   --  for Event_Pending_Reg_T use record
   --     Value at 0 range 0 .. 0;
   --  end record;

   --  --  Write 'T' to enable the event, 'F' to disable it.
   --  type Event_Enable_Reg_T is record
   --     Value : Bool;
   --  end record with Size => 32;
   --  for Event_Enable_Reg_T use record
   --     Value at 0 range 0 .. 0;
   --  end record;

   --  Load_Reg          : Load_Reg_T with Address          => To_Address (16#F000_2000#);
   --  Reload_Reg        : Reload_Reg_T with Address        => To_Address (16#F000_2004#);
   --  Enable_Reg        : Enable_Reg_T with Address        => To_Address (16#F000_2008#);
   --  Update_Value_Reg  : Update_Value_Reg_T with Address  => To_Address (16#F000_200C#);
   --  Value_Reg         : Value_Reg_T with Address         => To_Address (16#F000_2010#);
   --  Event_Status_Reg  : Event_Status_Reg_T with Address  => To_Address (16#F000_2014#);
   --  Event_Pending_Reg : Event_Pending_Reg_T with Address => To_Address (16#F000_2018#);
   --  Event_Enable_Reg  : Event_Enable_Reg_T with Address  => To_Address (16#F000_201C#);

   procedure Init is
   begin
      TIMER0_Periph.Load := 0;
      TIMER0_Periph.Reload := 0;
      TIMER0_Periph.EN.En := 0;
      TIMER0_Periph.Update_Value.update_value := 0;
      TIMER0_Periph.EV_PENDING.zero := 0;
      TIMER0_Periph.EV_ENABLE.zero := 0;


      --  Load_Reg.Value := U32 (0);
      --  Reload_Reg.Value := U32 (0);
      --  Enable_Reg.Value := F;
      --  Update_Value_Reg.Value := F;
      --  Event_Pending_Reg.Value := F;
      --  Event_Enable_Reg.Value := F;
   end Init;

   procedure Sleep (Clk_Cycles : Natural) is
   begin
      TIMER0_Periph.Load := UInt32 (Clk_Cycles);
      TIMER0_Periph.EN.En := 1;
      loop  
         TIMER0_Periph.Update_Value.update_value := 1;
         exit when TIMER0_Periph.Value = 0;
      end loop;
      TIMER0_Periph.EN.En := 0;
   end Sleep;

   --  procedure Sleep (Clk_Cycles : Natural) is
   --  begin
   --     Load_Reg.Value := U32 (Clk_Cycles);
   --     Enable_Reg.Value := T;
   --     loop  
   --        Update_Value_Reg.Value := T;
   --        exit when Value_Reg.Value = 0;
   --     end loop;
   --     Enable_Reg.Value := F;
   --  end Sleep;

end Timer0;
