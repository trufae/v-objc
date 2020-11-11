Sample iOS app in pure V
========================

Inspired by [CBased iOS App](https://github.com/richardjrossiii/CBasediOSApp)

2020 --pancake

TODO
----

This is an empty application that does nothing, ideally it should be providing
some basic functionality to serve as an example to interact with ObjC APIs on
the iPhone and such.

* There are still need to use the compiler by hand, workarounds have been added
  * V doesnt handle Nullable attribute, which are mandatory on iOS/ObjC
  * V doesnt handle __bridge casts, which are also mandatory and cant be disabled

The `.h` file contains some hacks to get the program to build, but this should
be removed at some point too.
