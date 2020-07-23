module objc

import objc.sel

// NSAutoReleasePool
pub fn new_autorelease_pool() Id {
	narp_klass := get_class('NSAutoReleasePool')
	narp := msg_send2 (narp_klass, sel.register('alloc'))
	return msg_send2 (narp, sel.register('init'))
}

pub fn (id Id)drain() {
	msg_send2(id, sel.register('drain'))
}

pub fn (id Id)release() {
	msg_send2(id, sel.register('release'))
}


