with GNATCOLL.Mmap; use GNATCOLL.Mmap;

package Elf is
    type InputObject is record
        File : Mapped_File;
        Reg  : Mapped_Region;
        --  Str  : Long.Str_Access;
    end record;

    function Load
        (Path : String) return InputObject;

end Elf;
