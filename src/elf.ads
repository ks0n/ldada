with GNATCOLL.Mmap; use GNATCOLL.Mmap;
with Ada.Containers.Vectors; use Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System;
with Elf_h;

package Elf is
    type InputObject is record
        Reg   : Mapped_Region;
    --      Addr  : System.Address;
    --      Ehdr  : Elf_h.Elf64_Ehdr;
    --      Shdrs : access Elf_h.Elf64_Shdr;
    end record;

    type InputSection is record
        Name: Unbounded_String;
        Shdr: Elf_h.Elf64_Shdr;
    end record;

    package InputSectionVector is new Vectors(Natural, InputSection);

    function Load
        (Path : String) return InputObject;

    function IsElf(MappedObj : System.Address) return Boolean;

    function IsObject(MappedObj : System.Address) return Boolean;

end Elf;
