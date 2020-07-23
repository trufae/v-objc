module sel

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

fn C.sel_registerName(chartpr) int

pub fn register(name string) int {
	return C.sel_registerName(name.str)
}
