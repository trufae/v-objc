module objc

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
fn C.nullable(voidptr) voidptr

pub fn class_get_instance_method(cls Class, name Sel) Method {
//	return Method(C.class_getInstanceMethod(cls, name)) // requires a bridged cast
//	return Method(C.class_getInstanceMethod(charptr(cls), name)) // requires _Nonnull
	// a := C.nullable(charptr(cls))
	a := charptr(cls)
	return Method(C.class_getInstanceMethod(a, name))
}

pub fn class_get_instance_size(cls Class) size_t {
	return C.class_getInstanceSize(cls)
}
