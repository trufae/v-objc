![CI](https://github.com/radare/v-r2/workflows/CI/badge.svg)

objc.v
======

Objective-C bindings for V

-- by pancake

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
