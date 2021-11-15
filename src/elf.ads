with GNATCOLL.Mmap; use GNATCOLL.Mmap;
with Interfaces;

package Elf is
    type InputObject is tagged record
        File : Mapped_File;
        Reg  : Mapped_Region;
        --  Str  : Long.Str_Access;
    end record;

    Subtype Byte is Interfaces.Unsigned_8;
    Type ByteArray is Array(Positive Range <>) of Byte;
    Type MagicByteArray is new ByteArray(1..4);

    function Load
        (Path : String) return InputObject;

    function IsValid
        (elf_file: InputObject) return Boolean;

    function Magic(elf: InputObject) return MagicByteArray;

end Elf;
