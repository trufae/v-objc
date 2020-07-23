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
	res := new_nsstring('Hello World')
	eprintln('$res')
	eprintln('$res.str()')
	s := res.str()
	assert s == 'Hello World'
	eprintln('$res')
}
