# dd

A version of dd, usable in earlier versions of Windows.
Based on the original version by John Newbigin, with some of my (Dmitry Brant) own tweaks, as I need them.

## Build instructions

* Get a virtual machine going with a clean install of Windows 2000.
* Install Borland Delphi 7 (available on the web).
* In Delphi, select File -> Open Project, and open `dd.dpr`.

## Random use cases

### SyQuest SparQ

I needed to recover data from some SyQuest SparQ cartridges, and the SparQ drive (which connects to the
parallel port) has drivers that work only with Windows NT and earlier (no support for Linux, of course).
Getting the driver installed was actually pretty simple, and it provides an emulated "SCSI" interface that
lets Windows access the drive at the block level, i.e. it becomes a standard removable disk. Therefore
it should be possible to use a tool like `dd` to read all the data from it.

With my modifications to this tool, it will attempt to retry reading bad sectors, which can actually
result in a successful read after several attempts, similar to "SpinRite" logic. (There doesn't seem to
be any caching at the level of the driver or the device, so retrying a read will definitely retry it
physically.) And if a read is definitely unsuccessful, it can skip and go to the next sector, while
padding the bad sector with zeros, mirroring the behavior of `conv=sync,noerror`.
