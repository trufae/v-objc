import objc

fn test_selectors() {
	alloc := objc.sel_register('alloc')
	assert alloc != 0
	init := objc.sel_register('init')
	assert init != 0
}

fn test_autoreleasepool() {
	ap := objc.new_nsautorelease_pool()
	ap.drain()
}

fn test_nsstring() {
	res := objc.new_nsstring('Hello World')
	assert res.str() == 'Hello World'
	res2 := res.append(' olleH')
	assert res2.str() == 'Hello World olleH'
	res.release()
	res2.release()
}
