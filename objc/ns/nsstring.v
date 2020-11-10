module ns

import objc

type NSString = voidptr

// NSString
pub fn new_nsstring(a string) NSString {
	nss_klass := objc.get_class('NSString')
	init := objc.sel_register('stringWithUTF8String:')
	return NSString(objc.msg_send3 (nss_klass, init, byteptr(a.str)))
}

pub fn (self NSString)str() string {
	r := objc.msg_send2 (self, objc.sel_register('UTF8String'))
	return tos_clone(voidptr(r))
}

pub fn (self NSString)append(s string) NSString {
	aps := objc.sel_register('stringByAppendingString:')
	tail := new_nsstring(s)
	res := objc.msg_send3 (self, aps, tail)
	tail.release()
	return res
}

pub fn (self NSString)release() {
	objc.msg_send2 (self, objc.sel_register('release'))
}

pub fn (self NSString)drain() {
	objc.msg_send2 (self, objc.sel_register('drain'))
}

