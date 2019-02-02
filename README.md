Ideapad 300-15ISK High Sierra 10.13.6 
======================================
Confirmed to work flawlessly on 10.13.6
At this point only DSDT.dsl and SSDT-2-CB-01.dsl (GFX0->IGPU rename) should be used, other tables are more or less useless.

Notes
=====
* Built-in wifi won't work, I use TL-WN725N nano usb dongle, work better than this noteboot built-in wifi.
* CPU speed is locked to 2.1GHz in CPU/HWPValue in Clover. Just to avoid loud fan noise. 
* D5CN47WW (24 Oct 2016, latest) BIOS is used, however probably BIOS version doesn't matter.

TODO
====
* Try to integrate ELAN touchpad driver. Right now there's no multitouch.
* Make screen backlight work full-scale.
