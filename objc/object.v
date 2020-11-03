module objc

type Object = voidptr

fn C.object_isClass(voidptr) bool
fn C.object_getClass(voidptr) voidptr
fn C.object_getClassName(voidptr) voidptr

pub fn (self Object)drain() {
	msg_send2(self, sel_register('drain'))
}

pub fn object_is_class(a voidptr) bool {
	return C.object_isClass(a)
}

pub fn object_get_class(a voidptr) voidptr {
	return C.object_getClass(a)
}

pub fn object_get_class_name(a voidptr) voidptr {
	return C.object_getClassName(a)
}
