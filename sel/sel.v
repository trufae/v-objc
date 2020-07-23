module sel

type Sel voidptr

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

fn C.sel_registerName(chartpr) int
fn C.sel_getUid(chartpr) int
fn C.sel_getName(int) byteptr

pub fn register(name string) Sel {
	return C.sel_registerName(name.str)
}

pub fn uid(name string) Sel {
	return Sel(C.sel_getUid(name.str))
}

pub fn get_name(s Sel) string {
	return tos_clone(C.sel_getName(s))
}
