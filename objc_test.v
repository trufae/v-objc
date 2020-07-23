module objc

import sel

fn test_selectors() {
	alloc := sel.register('alloc')
	assert alloc != 0
	init := sel.register('init')
	assert init != 0
}

fn test_autoreleasepool() {
	ap := objc.new_autorelease_pool()
	ap.drain()
}

fn test_nsstring() {
// XXX segfaults	res := new_nsstring('Hello World')
	// println('$res')
}