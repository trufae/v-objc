module objc

type Class = Id

fn C.class_addMethod(voidptr, voidptr, voidptr, string)
fn C.class_addProtocol(voidptr, voidptr) bool
fn C.class_copyIvarList(voidptr, voidptr) voidptr
fn C.class_copyMethodList(voidptr, voidptr) voidptr
fn C.class_copyProtocolList(voidptr, voidptr) voidptr
fn C.class_getClassMethod(voidptr, voidptr) voidptr
fn C.class_getImageName(voidptr) voidptr
fn C.class_getInstanceMethod(voidptr, voidptr) voidptr
fn C.class_getInstanceSize(voidptr) voidptr
fn C.class_getName(voidptr) bool
fn C.class_getSuperclass(voidptr) voidptr
fn C.class_isMetaClass(voidptr) bool

pub fn class_get_instance_method(cls Class, name Sel) Method {
	return C.class_getInstanceMethod(cls, name)
}

pub fn class_get_instance_size(cls Class, name Sel) size_t {
	return C.class_getInstanceSize(cls, name)
}

