// Copyright 2020 by FireEye, Inc.
// You may not use this file except in compliance with the license. The license should have been received with this file. You may obtain a copy of the license at:
// https://github.com/fireeye/sunburst_countermeasures/blob/main/LICENSE.txt

rule APT_Dropper_Raw64_TEARDROP_1
{
    meta:
        author = "FireEye"
        description = "This rule looks for portions of the TEARDROP backdoor that are vital to how it functions. TEARDROP is a memory only dropper that can read files and registry keys, XOR decode an embedded payload, and load the payload into memory. TEARDROP persists as a Windows service and has been observed dropping Cobalt Strike BEACON into memory."
    strings:
        $sb1 = { C7 44 24 ?? 80 00 00 00 [0-64] BA 00 00 00 80 [0-32] 48 8D 0D [4-32] FF 15 [4] 48 83 F8 FF [2-64] 41 B8 40 00 00 00 [0-64] FF 15 [4-5] 85 C0 7? ?? 80 3D [4] FF }
        $sb2 = { 80 3D [4] D8 [2-32] 41 B8 04 00 00 00 [0-32] C7 44 24 ?? 4A 46 49 46 [0-32] E8 [4-5] 85 C0 [2-32] C6 05 [4] 6A C6 05 [4] 70 C6 05 [4] 65 C6 05 [4] 67 }
        $sb3 = { BA [4] 48 89 ?? E8 [4] 41 B8 [4] 48 89 ?? 48 89 ?? E8 [4] 85 C0 7? [1-32] 8B 44 24 ?? 48 8B ?? 24 [1-16] 48 01 C8 [0-32] FF D0 }
    condition:
        all of them
}

rule APT_Dropper_Win64_TEARDROP_2
{
    meta:
        author = "FireEye"
        description = "This rule is intended match specific sequences of opcode found within TEARDROP, including those that decode the embedded payload. TEARDROP is a memory only dropper that can read files and registry keys, XOR decode an embedded payload, and load the payload into memory. TEARDROP persists as a Windows service and has been observed dropping Cobalt Strike BEACON into memory."
    strings:
        $loc_4218FE24A5 = { 48 89 C8 45 0F B6 4C 0A 30 }
        $loc_4218FE36CA = { 48 C1 E0 04 83 C3 01 48 01 E8 8B 48 28 8B 50 30 44 8B 40 2C 48 01 F1 4C 01 FA }
        $loc_4218FE2747 = { C6 05 ?? ?? ?? ?? 6A C6 05 ?? ?? ?? ?? 70 C6 05 ?? ?? ?? ?? 65 C6 05 ?? ?? ?? ?? 67 }
        $loc_5551D725A0 = { 48 89 C8 45 0F B6 4C 0A 30 48 89 CE 44 89 CF 48 F7 E3 48 C1 EA 05 48 8D 04 92 48 8D 04 42 48 C1 E0 04 48 29 C6 }
        $loc_5551D726F6 = { 53 4F 46 54 57 41 52 45 ?? ?? ?? ?? 66 74 5C 43 ?? ?? ?? ?? 00 }
    condition:
        (uint16(0) == 0x5A4D and uint32(uint32(0x3C)) == 0x00004550) and any of them
}
