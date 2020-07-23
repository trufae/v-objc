module objc

import sel

// NSAutoReleasePool
fn new_autorelease_pool() Id {
	narp_klass := get_class('NSAutoReleasePool')
	narp := msg_send (narp_klass, sel.register('alloc'))
	return msg_send (narp, sel.register('init'))
}

fn (id Id)drain() {
	msg_send(id, sel.register('drain'))
}

// NSString
fn new_nsstring(a string) Id {
	nss_klass := get_class('NSString')
	init := sel.register('stringWithUTF8String:')
	return msg_send (nss_klass, init, a.str)
}
