[![CI](https://github.com/trufae/v-objc/workflows/CI/badge.svg)](https://github.com/trufae/v-objc/actions?query=workflow%3ACI)

objc.v
======

Interacting with Objective-C from V

This is needed for several things:

* Replace the `#` prefix for inlining objc code in `_darwin` files
* Write iOS and macOS apps in pure V
* No .m code involved
* UIKit and other libraries will be set on top of this one

-- by pancake

Status
------

The current implementation is working and stable, it could be more strict
in types and can extend the amount of supported framework APIs.


Example
-------

```go
import trufae.objc.ns

fn main() {
	ap := ns.new_nsautorelease_pool()
	a := ns.new_nsstring('hello world')
	println('$a') // automatic .str() unwrapping
	ap.drain()
}

```

Future
------

If this module gets integrated into the compiler it would be possible to
do dynamic typing by sending objc messages.

Proposed syntaxes:

```
// class vs variable? maybe use a string syntax?
mmm := objc[NSString initWithCharacters: 'hello' length: 5]
mmm := objc[NSString initWithString: 'hello']
sss := objc[mmm initWithString: 'hello']
sss := objc.call([mmm, 'initWithString:', 'hello', 'length:', 5]) // XXX this looks wrong to me
 ..
msg := NSString(objc.call('NSString stringWithUTF8String:', ['hello world']))
gsm := objc.call('$msg append:', [' !!!!'])
 ..
msg := objc [ NSString stringWithUTF8String: 'hello world' ]
 ..
msg := [ 'NSString' stringWithUTF8String: 'hello world' ]
sss := [ msg stringWithUTF8String: 'hello world' ]

// as type definition, looks fun because it fits the struct syntax, but its actually calling code
type NSString = objc.Class
msg := NSString {
	stringWithCharacters: 'hello'
	length: 5
}
gsm := msg { append: ' world' }

// so it may be better to pick a different syntax for it
msg := objc.lookup_class('NSString').call({
	initWithString: 'hello'
})

..
```

Links for inspiration:

* https://github.com/frida/frida-objc-bridge/blob/master/index.js
