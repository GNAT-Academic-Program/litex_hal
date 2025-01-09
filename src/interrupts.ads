with Soc; use Soc;

package Interrupts is

   --  function Irq_Getie return UInt32 with
   --     Import, Convention => C, External_Name => "irq_getie";

   --  procedure Irq_Setie (Value : UInt32) with
   --     Import, Convention => C, External_Name => "irq_setie";

   --  function Irq_Getmask return UInt32 with
   --     Import, Convention => C, External_Name => "irq_getmask";

   --  procedure Irq_Setmask (Value : UInt32) with
   --     Import, Convention => C, External_Name => "irq_setmask";

   --  function Irq_Pending return UInt32 with
   --     Import, Convention => C, External_Name => "irq_pending";

   procedure Setup;

   procedure Isr with
     Export, Convention => C, External_Name => "isr";
   
end Interrupts;