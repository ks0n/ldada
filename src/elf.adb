with Text_IO; use Text_IO;
with GNATCOLL.Mmap; use GNATCOLL.Mmap;

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Pointers;

with System.Address_to_Access_Conversions; use System;
with Elf_h;

use type Elf_h.Elf64_Ehdr_array948;

package body Elf is
    package ToElfEhdr is new Address_to_Access_Conversions(
        Object => Elf_h.Elf64_Ehdr);

    NotAnElfException : exception;
    NotAnObjectException : exception;

    function IsElf(MappedObj : System.Address) return Boolean is
        ehdr : Elf_h.Elf64_Ehdr;
        type MagicT is array(0..Elf_h.SELFMAG-1) of aliased unsigned_char;
        expected_magic: MagicT;
    begin
        expected_magic := (Elf_h.ELFMAG0, Elf_h.ELFMAG1, Elf_h.ELFMAG2, Elf_h.ELFMAG3);
        ehdr := ToElfEhdr.To_Pointer(MappedObj).all;
        return MagicT(ehdr.e_ident(0..Elf_h.SELFMAG-1)) = expected_magic;
    end IsElf;

    function IsObject(MappedObj : System.Address) return Boolean is
        ehdr : Elf_h.Elf64_Ehdr;
    begin
        ehdr := ToElfEhdr.To_Pointer(MappedObj).all;
        return ehdr.e_type = Elf_h.ET_REL;
    end IsObject;

    function Collect_Sections(MappedObj : System.Address)
        return InputSectionVector.Vector is
        --  type ShdrArrayIndices is Natural;
        type ShdrArray is array (Natural range <>) of aliased Elf_h.Elf64_Shdr;

        package ShdrArrayPtr is new Interfaces.C.Pointers
            (Natural, Elf_h.Elf64_Shdr, ShdrArray, );
        ehdr     : Elf_h.Elf64_Ehdr;
        section  : InputSection;
        sections : InputSectionVector.Vector;
    begin
        ehdr := ToElfEhdr.To_Pointer(MappedObj).all;


        for I in 0..ehdr.e_shnum loop
            Put_Line("section " & I'Image);
        end loop;

        return sections;
    end Collect_Sections;

    function Load(Path : String) return InputObject is
        File  : Mapped_File;
        Reg   : Mapped_Region;
        Addr  : System.Address;
    begin
        File := Open_Read(Path);
        Reg := Read(File);
        Close(File);

        MappedObj := Data_Address(Reg);

        if not IsElf(MappedObj) then
            raise NotAnElfException with Path;
        end if;

        if not IsObject(MappedObj) then
            raise NotAnObjectException with Path;
        end if;

        sections := Collect_Sections(MappedObj);

        return InputObject'(Reg);
    end Load;
end Elf;
