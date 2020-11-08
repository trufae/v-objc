module objc

fn C.sel_registerName(chartpr) voidptr
fn C.sel_getUid(chartpr) int
fn C.sel_getName(int) byteptr

pub fn sel_register(name string) Sel {
	return C.sel_registerName(name.str)
}

pub fn sel_uid(name string) Sel {
	return Sel(C.sel_getUid(name.str))
}

pub fn sel_get_name(s Sel) string {
	return tos_clone(C.sel_getName(s))
}
