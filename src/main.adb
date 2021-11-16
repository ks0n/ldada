with Text_IO; use Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Containers.Vectors; use Ada.Containers;

with Elf; use Elf;

procedure main is
    --  package InputObjectVector is new Vectors(Natural, InputObject);

    input_object : InputObject;
    --  input_objects: InputObjectVector.Vector;
begin
    if Argument_Count = 0 then
        Put_Line(Current_Error, "Usage: " & Command_Name & " <elf obj>...");
        Set_Exit_Status(Failure);
        return;
    end if;

    for i in 1..Argument_Count loop
        input_object := Load(Argument(i));
        --  input_objects.Append(input_object);
    end loop;

    --  Put_Line(input_objects'Image);
end main;
