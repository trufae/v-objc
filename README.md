![CI](https://github.com/trufae/v-objc/workflows/CI/badge.svg)

objc.v
======

Interacting with Objective-C from V

This is needed for several things:

* Replace the `#` prefix for inlining objc code in `_darwin` files
* Write iOS and macOS apps in pure V
* No .m code involved
* UIKit and other libraries will be set on top of this one

-- by pancake

Bugs
----

This library is under development, the V compiler is not handling well
some constructions and ends up generating segfaultable code.

Links for inspiration:

* https://github.com/frida/frida-objc-bridge/blob/master/index.js

Example
-------

```go
import trufae.objc

fn main() {
	ap := objc.new_nsautorelease_pool()
	a := objc.new_nsstring('hello world')
	println('$a') // automatic .str() unwrapping
	ap.drain()
}

```
