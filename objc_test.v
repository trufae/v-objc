import objc
import objc.sel as sel

fn test_selectors() {
	alloc := sel.register('alloc')
	assert alloc != 0
	init := sel.register('init')
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
