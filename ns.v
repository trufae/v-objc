module objc

import sel

// NSAutoReleasePool
fn new_autorelease_pool() Id {
	narp_klass := get_class('NSAutoReleasePool')
	narp := msg_send (narp_klass, sel.register('alloc'))
	return msg_send (narp, sel.register('init'))
}

fn (id Id)drain() {
	msg_send(id, sel.register("drain"))
}

// NSString
fn new_nsstring(a string) Id {
	// init := sel.register_name('initWithString:')

	ns_klass := get_class('NSString')
	ns := msg_send (ns_klass, sel.register('alloc'))
	// objc.msg_send (ns, init, a.str)
	return Id(ns)
}
