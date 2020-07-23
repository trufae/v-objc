module objc

import sel

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


type NSString Id

// NSString
pub fn new_nsstring(a string) NSString {
	nss_klass := get_class('NSString')
	init := sel.register('stringWithUTF8String:')
	return msg_send3 (nss_klass, init, byteptr(a.str))
}

pub fn (self NSString)str() string {
	utf8string := sel.register('UTF8String')
	r := msg_send2 (self, utf8string)
	return tos_clone(*r)
}

pub fn (self NSString)append(s string) NSString {
	append_str := sel.register('stringByAppendingString:')
	return  msg_send3 (self, append_str, byteptr(s.str))
}
