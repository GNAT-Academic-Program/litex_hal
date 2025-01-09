package Utils is
   procedure Exit_Handler with
     Export, Convention => C, External_Name => "__gnat_exit";

   procedure Isr with
     Export, Convention => C, External_Name => "isr";
   
end Utils;