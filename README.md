Lenovo Ideapad 300-15ISK / High Sierra 10.13.6 
======================================
Confirmed to work flawlessly with 10.13.6
At this point DSDT.dsl and SSDT-2-CB-01.dsl ACPI tables (GFX0->IGPU rename) were used. Other tables listed here are not in use.

Notes
=====
* Multitouch, 2-finger scroll and two-finger-click support can be located in "AppleSmartTouchpad" branch. At the point of writing this lines AppleSmartTouchpad is in early development stage and probably more or less buggy.
* Built-in wifi won't work (no drivers). I used TL-WN725N nano usb dongle, which actually performing better than built-in wifi.
* CPU speed is locked to 1.8GHz in CPU/HWPValue section of Clover. Just to avoid loud fan noise. 
* D5CN47WW (24 Oct 2016, latest) BIOS is used, however probably BIOS version doesn't matter.

TODO
====
* Remove accidental input prevention from SmartTouchpad (buggy)
