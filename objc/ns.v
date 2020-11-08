module objc

type NSAutoReleasePool = voidptr // Id

pub fn (arp &NSAutoReleasePool)drain() {
	msg_send2(Id(arp), sel_register('drain'))
}

pub fn new_nsautorelease_pool() &NSAutoReleasePool {
	narp_klass := get_class('NSAutoReleasePool')
	narp := msg_send2 (narp_klass, sel_register('alloc'))
	return msg_send2 (narp, sel_register('init'))
}

pub fn (id &Id)drain() {
	msg_send2(id, sel_register('drain'))
}

pub fn (id &Id)release() {
	msg_send2(id, sel_register('release'))
}


