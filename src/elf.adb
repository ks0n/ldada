with Text_IO; use Text_IO;
with GNATCOLL.Mmap; use GNATCOLL.Mmap;

package body Elf is
    function Load(Path : String) return InputObject is
        File : Mapped_File;
        Reg : Mapped_Region;
        Str : Str_Access;
    begin
        File := Open_Read(Path);
        Reg := Read(File);
        Close(File);
        Str := Data(Reg);

        -- TODO: check ELFMAGIC

        return InputObject'(File, Reg);
    end Load;

    function Magic(elf: InputObject) return MagicByteArray is
        Result: Constant MagicByteArray;
        For Result'Address use elf.Reg'Address;
        Pragma Import(Convention => Ada, Entity => Result);
    begin
        return Result;
    end Magic;

    function IsValid(elf_file: InputObject) return Boolean is
        MagicInput: MagicByteArray;
        MagicExpected : MagicByteArray := (16#7f#, 16#45#, 16#4C#, 16#46#);
    begin
        MagicInput := Magic(elf_file);
        return MagicInput = MagicExpected;
    end IsValid;
end Elf;
