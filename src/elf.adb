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
end Elf;
