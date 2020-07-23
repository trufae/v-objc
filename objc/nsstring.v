module objc

import objc.sel

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
	tail := new_nsstring(s)
	res := msg_send3 (self, append_str, tail)
	tail.release()
	return res
}

