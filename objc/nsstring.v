module objc

type NSString = voidptr

// NSString
pub fn new_nsstring(a string) NSString {
	nss_klass := get_class('NSString')
	init := sel_register('stringWithUTF8String:')
	return NSString(msg_send3 (nss_klass, init, byteptr(a.str)))
}

pub fn (self NSString)str() string {
	r := msg_send2 (self, sel_register('UTF8String'))
	return tos_clone(voidptr(r))
}

pub fn (self NSString)append(s string) NSString {
	aps := sel_register('stringByAppendingString:')
	tail := new_nsstring(s)
	res := msg_send3 (self, aps, tail)
	tail.release()
	return res
}

pub fn (self NSString)release() {
	msg_send2 (self, sel_register('release'))
}

pub fn (self NSString)drain() {
	msg_send2 (self, sel_register('drain'))
}

