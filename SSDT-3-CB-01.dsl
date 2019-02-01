/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-3-CB-01.aml, Fri Feb  1 18:33:50 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002D4 (724)
 *     Revision         0x01
 *     Checksum         0x1A
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * iASL Warning: There were 5 external control methods found during
     * disassembly, but only 0 were resolved (5 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.GGOV, MethodObj)    // Warning: Unknown method, guessing 0 arguments
    External (_SB_.PCI0.GEXP.GEPS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.PCI0.GEXP.SGEP, MethodObj)    // Warning: Unknown method, guessing 3 arguments
    External (_SB_.SGOV, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (ADBG, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (BID_, UnknownObj)    // Warning: Unknown object
    External (EIDF, UnknownObj)    // Warning: Unknown object

    Scope (\)
    {
        Device (EIAD)
        {
            Name (_HID, EisaId ("INT3399"))  // _HID: Hardware ID
            Name (_S0W, Zero)  // _S0W: S0 Device Wake State
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                ADBG ("EIAD STA")
                If (LEqual (BID, 0x20))
                {
                    Return (0x0F)
                }
                ElseIf (LEqual (EIDF, One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                Name (PECE, Zero)
                Name (PECD, Zero)
                Name (DFUE, Zero)
                Name (DFUD, Zero)
                Name (OLDV, Zero)
                Name (PECV, Zero)
                Name (DFUV, Zero)
                If (LEqual (Arg0, ToUUID ("adf03c1f-ee76-4f23-9def-cdae22a36acf")))
                {
                    If (LEqual (One, ToInteger (Arg1)))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                ADBG ("EIAD F:0")
                                Return (Buffer (One)
                                {
                                     0x0F                                           
                                })
                            }
                            Case (One)
                            {
                                ADBG ("EIAD F:1")
                                If (LNotEqual (BID, 0x20))
                                {
                                    Store (DerefOf (Index (Arg3, Zero)), PECE)
                                    Store (DerefOf (Index (Arg3, One)), PECD)
                                    Store (\_SB.PCI0.GEXP.GEPS (Zero), 0x0C)
                                    OLDV
                                    \_SB.PCI0.GEXP.SGEP (Zero, 0x0C, PECE)
                                    If (LGreater (PECD, Zero))
                                    {
                                        Sleep (PECD)
                                        \_SB.PCI0.GEXP.SGEP (Zero, 0x0C, OLDV)
                                    }
                                }

                                Return (Zero)
                            }
                            Case (0x02)
                            {
                                ADBG ("EIAD F:2")
                                Store (DerefOf (Index (Arg3, Zero)), DFUE)
                                Store (DerefOf (Index (Arg3, One)), DFUD)
                                If (LEqual (BID, 0x20))
                                {
                                    Store (\_SB.GGOV (), 0x02000015)
                                    OLDV
                                    \_SB.SGOV (0x02000015, DFUE)
                                }
                                Else
                                {
                                    Store (\_SB.GGOV (), 0x02040003)
                                    OLDV
                                    \_SB.SGOV (0x02040003, DFUE)
                                }

                                If (LGreater (DFUD, Zero))
                                {
                                    Sleep (DFUD)
                                    If (LEqual (BID, 0x20))
                                    {
                                        \_SB.SGOV (0x02000015, OLDV)
                                    }
                                    Else
                                    {
                                        \_SB.SGOV (0x02040003, OLDV)
                                    }
                                }

                                Return (Zero)
                            }
                            Case (0x03)
                            {
                                ADBG ("EIAD F:3")
                                If (LEqual (BID, 0x20))
                                {
                                    Store (\_SB.GGOV (), 0x02000015)
                                    DFUV
                                    Store (One, PECV)
                                }
                                Else
                                {
                                    Store (\_SB.GGOV (), 0x02040003)
                                    DFUV
                                    Store (\_SB.PCI0.GEXP.GEPS (Zero), 0x0C)
                                    PECV
                                }

                                Return (Package (0x02)
                                {
                                    PECV, 
                                    DFUV
                                })
                            }

                        }

                        Return (Zero)
                    }

                    Return (Zero)
                }

                Return (Zero)
            }
        }
    }
}

