objc.v
======

Objective-C bindings for V

-- by pancake

Example
-------

```go
import objc.ns

fn main() {
	ap := ns.new_nsautorelease_pool()

	s := new_nsstring('hello world')
	println('$s')

	ap.drain()
}

```
