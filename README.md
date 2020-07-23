objc.v
======

Objective-C bindings for V

-- by pancake

Example
-------

```go
import trufae.objc

fn main() {
	ap := objc.new_autorelease_pool()
	a := objc.new_nsstring('hello world')
	println('$a') // automatic .str() unwrapping
	ap.drain()
}

```
